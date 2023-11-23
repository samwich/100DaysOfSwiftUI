//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Sam Johnson on 2023-11-16.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id:\.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("Searching")
        }
    }
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            return allNames
        } else {
            return allNames.filter{ $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#Preview {
    ContentView()
}
