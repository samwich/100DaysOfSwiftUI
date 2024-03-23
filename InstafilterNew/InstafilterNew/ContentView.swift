//
//  ContentView.swift
//  InstafilterNew
//
//  Created by Sam Johnson on 2024-03-23.
//

import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var processedImage: Image?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5
    
    @State private var showingFilterSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFill()
                    } else {
                        ContentUnavailableView {
                            Label("No Picture", systemImage: "photo.badge.plus")
                        } description: {
                            Text("Tap to import a photo")
                        }
                    }
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                VStack {
                    Text(currentFilter.name)
                    
                    if currentFilter.inputKeys.contains(kCIInputIntensityKey) {
                        HStack {
                            Text("Intensity")
                            Slider(value: $filterIntensity)
                                .onChange(of: filterIntensity, applyProcessing)
                        }
                    }
                    
                    if currentFilter.inputKeys.contains(kCIInputRadiusKey) {
                        HStack {
                            Text("Radius")
                            Slider(value: $filterRadius)
                                .onChange(of: filterRadius, applyProcessing)
                        }
                    }
                    
                    if currentFilter.inputKeys.contains(kCIInputScaleKey) {
                        HStack {
                            Text("Scale")
                            Slider(value: $filterScale)
                                .onChange(of: filterScale, applyProcessing)
                        }
                    }
                }
                .disabled(selectedItem == nil)
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter") {
                        showingFilterSheet = true
                    }
                    .disabled(selectedItem == nil)
                    
                    Spacer()
                    
                    if let processedImage {
                        ShareLink(
                            item: processedImage,
                            preview: SharePreview("Instafilter image", image: processedImage)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .onChange(of: selectedItem, loadImage)
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                Section {
                    Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                    Button("Edges") { setFilter(CIFilter.edges()) }
                    Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                    Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                    Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                    Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                    Button("Vignette") { setFilter(CIFilter.vignette()) }
                }
                Button("Cancel", role: .cancel) {}
            }
        }
    }
        
    func loadImage() {
        Task {
            guard let inputData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputUIImage = UIImage(data: inputData) else { return }
            
            // UIImage -> CIImage
            let beginCIImage = CIImage(image: inputUIImage)
            // currentFilter.inputImage is bad, so use setValue(forKey:) instead
            currentFilter.setValue(beginCIImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    @MainActor
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()

        filterCount += 1
        if filterCount >= 2 {
            requestReview()
            filterCount = 0
        }
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey) }
        
        guard let outputCIImage = currentFilter.outputImage else { return }
        
        // CIImage -> CGImage
        if let cgImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) {
            // CGImage -> UIImage
            let uiImage = UIImage(cgImage: cgImage)
            // UIImage -> Image
            processedImage = Image(uiImage: uiImage)
        }
    }
}

#Preview {
    ContentView()
}
