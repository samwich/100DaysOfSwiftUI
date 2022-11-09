//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sam Johnson on 2022-11-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button() {
            print("Button was tapped!")
        } label: {
            Label("Edit", systemImage: "pencil")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
