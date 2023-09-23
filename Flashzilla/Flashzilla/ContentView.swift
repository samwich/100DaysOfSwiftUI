//
//  ContentView.swift
//  Flashzilla
//
//  Created by Sam Johnson on 2023-09-22.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded({ _ in
                    print("VStack tapped")
                })
        )
//        .highPriorityGesture(
//            TapGesture()
//                .onEnded {
//                    print("VStack tapped")
//                }
//        )
        .padding()
    }
}

#Preview {
    ContentView()
}
