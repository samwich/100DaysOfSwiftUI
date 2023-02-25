//
//  PersonEditView.swift
//  Nomenclator
//
//  Created by Sam Johnson on 2023-02-22.
//

import SwiftUI

struct PersonEditView: View {
    @Environment(\.dismiss) var dismiss

    @StateObject var viewModel: ContentView.ViewModel
    
    var body: some View {
        NavigationView() {
            VStack {
                Image(uiImage: viewModel.image!)
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                TextField("Name", text: $viewModel.name)
                Button("Save") {
                    viewModel.save()
                    dismiss()
                }
                .padding()
            }
        }
    }
}

//struct PersonEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonEditView()
//    }
//}
