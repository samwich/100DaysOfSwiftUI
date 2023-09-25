//
//  ContentView.swift
//  Flashzilla
//
//  Created by Sam Johnson on 2023-09-22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State private var scale = 1.0
    
    var body: some View {
        VStack {
            Text("Hello, World animation!")
                .padding()
                .scaleEffect(scale)
                .onTapGesture {
                    withOptionalAnimation {
                        scale *= 1.5
                    }
                }
            Text("Hello, World transparency!")
                .padding()
                .background(reduceTransparency ? .black : .black.opacity(0.5))
                .foregroundColor(.white)
                .clipShape(.capsule)
        }
        .padding()
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

#Preview {
    ContentView()
}
