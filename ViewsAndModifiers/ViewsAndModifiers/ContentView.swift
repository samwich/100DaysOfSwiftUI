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
            Button("Hello, world!") {
                useRedText.toggle()
            }
            .foregroundColor(useRedText ? .red : .blue)
            
            if useRedText {
                Button("Hello, world!") {
                    useRedText.toggle()
                }
                .foregroundColor(.red)
            } else {
                Button("Hello, world!") {
                    useRedText.toggle()
                }
                .foregroundColor(.blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
