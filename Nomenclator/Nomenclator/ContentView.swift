//
//  ContentView.swift
//  Nomenclator
//
//  Created by Sam Johnson on 2023-02-21.
//

import SwiftUI

struct ContentView: View {
    @State private var people: [Person]

    @State private var showingImagePicker = false
    @State private var image: UIImage?

    @State private var showingNameEditor = false
    @State private var name = "bob"
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Add") {
                    showingImagePicker = true
                }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $image)
                }
                .onChange(of: image) { _ in
                    showingNameEditor = true
                }
                .sheet(isPresented: $showingNameEditor) {
                    VStack {
                        Text("selected Image")
                        TextField("Name", text: $name)
                        Button("Save") {
                            save()
                            showingNameEditor = false // this should probably be a dismiss environment thingy
                        }
                    }
                }
                List {
                    ForEach(people) { person in
                        NavigationLink {
                            Image(uiImage: UIImage(contentsOfFile: person.imageURL().path)!)
                                .resizable()
                                .scaledToFit()
                                .padding()
                            Text(person.name)
                                .font(.largeTitle)
                        } label: {
                            HStack {
                                Image(uiImage: UIImage(contentsOfFile: person.imageURL().path)!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                Text(person.name)
                            }
                        }
                    }
                }
                .navigationTitle("Nomenclator")
            }
        }
    }

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
        people.append(person)
        
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: Person.peopleURL, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save people.json")
        }
        do {
            let imageURL = FileManager.documentsDirectory.appendingPathComponent(person.idString)
            try image?.jpegData(compressionQuality: 0.8)?.write(to: imageURL, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save person image.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
