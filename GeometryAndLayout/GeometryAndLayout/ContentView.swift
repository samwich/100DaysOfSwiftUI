//
//  ContentView.swift
//  GeometryAndLayout
//
//  Created by Sam Johnson on 2023-10-04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world! .background(.red)")
                .background(.red)
            Text("Hello, world! .padding().background(.orange)")
                .padding()
                .background(.orange)
            Text("Hello, world! .background(.yellow).padding()")
                .background(.yellow)
                .padding()
        }
        .background(.green)
    }
}

#Preview {
    ContentView()
}
