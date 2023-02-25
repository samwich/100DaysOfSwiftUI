//
//  ContentView-ViewModel.swift
//  Nomenclator
//
//  Created by Sam Johnson on 2023-02-22.
//

import SwiftUI

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var people: [Person]
        
        @Published var showingImagePicker = false
        @Published var image: UIImage?
        
        @Published var showingNameEditor = false
        @Published var name = ""

        init() {
            do {
                let data = try Data(contentsOf: Person.peopleURL)
                people = try JSONDecoder().decode([Person].self, from: data)
            } catch {
                people = []
            }
        }
        
        func save() {
            let person = Person(id: UUID(), name: name)
            
            do {
                try image?.jpegData(compressionQuality: 0.8)?.write(to: person.imageURL(), options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save person image.")
                return
            }
            
            people.append(person)
            people.sort() { $0.name < $1.name }
            name = ""
            
            do {
                let data = try JSONEncoder().encode(people)
                try data.write(to: Person.peopleURL, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save people.json")
            }
        }

    }
}
