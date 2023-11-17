//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Sam Johnson on 2023-11-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
                    .navigationTitle("Primary")
            } label: {
                Text("Hello, world!")
            }
            .navigationTitle("Primary")
            
            Text("Secondary")
        }
    }
}

#Preview {
    ContentView()
}
