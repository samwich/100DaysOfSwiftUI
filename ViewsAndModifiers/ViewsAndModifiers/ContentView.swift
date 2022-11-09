//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Sam Johnson on 2022-11-09.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        VStack {
            Text("Bubbles")
                .font(.largeTitle)
                .blur(radius: 0)
            Text("Blossom")
            Text("Buttercup")
        }
        .font(.title)
        .blur(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
