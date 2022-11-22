//
//  ContentView.swift
//  Animations
//
//  Created by Sam Johnson on 2022-11-21.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello, SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var letterRadius = 0.0
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .clipShape(RoundedRectangle(cornerRadius: letterRadius))
                    .offset(dragAmount)
                    .animation(
                        .default.delay(Double(num) / 20),
                        value: dragAmount
                    )
            }
        }
        .gesture(
            DragGesture()
                .onChanged {
                    dragAmount = $0.translation
                    letterRadius = 10
                }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                    letterRadius = 0
                }
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
