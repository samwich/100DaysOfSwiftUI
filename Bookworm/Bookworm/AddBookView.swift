//
//  AddBookView.swift
//  Bookworm
//
//  Created by Sam Johnson on 2022-12-14.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(
                            title: title,
                            author: author,
                            genre: genre,
                            review: review,
                            rating: rating,
                            date: Date.now
                        )
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
                .disabled(!bookIsValid)
            }
            .navigationTitle("Add Book")
        }
    }
    
    var bookIsValid: Bool {
        
        let fields = [title, author, genre]
        
        for field in fields {
            if field.trimmingCharacters(in: .whitespaces).isEmpty {
                return false
            }
        }
        
        return true
    }
}

#Preview { 
    AddBookView()
}
