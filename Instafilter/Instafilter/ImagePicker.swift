//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Sam Johnson on 2023-01-03.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        return PHPickerViewController(configuration: config)
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
}
