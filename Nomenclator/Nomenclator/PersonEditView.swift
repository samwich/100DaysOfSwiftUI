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
                    save()
                    dismiss()
                }
                .padding()
                if let location = viewModel.location {
                    MapView(location: location)
                } else {
                    Text("No location available.")
                }
            }
        }
    }
    
    func save() {
        let person = Person(id: UUID(), name: viewModel.name, location: viewModel.location)
        
        viewModel.save(person: person)
    }
}

//struct PersonEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonEditView()
//    }
//}
