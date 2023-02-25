//
//  ContentView.swift
//  Nomenclator
//
//  Created by Sam Johnson on 2023-02-21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Import Photo") {
                    viewModel.showingImagePicker = true
                }
                .sheet(isPresented: $viewModel.showingImagePicker) {
                    ImagePicker(image: $viewModel.image)
                }
                .onChange(of: viewModel.image) { _ in
                    if viewModel.image != nil {
                        viewModel.location = viewModel.locationFetcher.lastKnownLocation
                        viewModel.showingNameEditor = true
                    }
                }
                .sheet(isPresented: $viewModel.showingNameEditor) {
                    PersonEditView(viewModel: viewModel)
                }
                
                List {
                    ForEach(viewModel.people) { person in
                        PersonListItemView(person: person)
                    }
                }
                .navigationTitle("Nomenclator")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
