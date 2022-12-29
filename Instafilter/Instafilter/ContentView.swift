//
//  ContentView.swift
//  Instafilter
//
//  Created by Sam Johnson on 2022-12-29.
//

import SwiftUI

struct ContentView: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white

    var body: some View {
        VStack {
            Text("Hello, world!")
                .frame(width: 300, height: 300)
                .background(backgroundColor.animation(.default))
                .onTapGesture {
                    showingConfirmation = true
                }
                .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                    Button("Red") { backgroundColor = .red }
                    Button("Green") { backgroundColor = .green }
                    Button("Blue") { backgroundColor = .blue }
                    Button("Cancel", role: .cancel) {}
                } message: {
                    Text("Select a new color")
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
