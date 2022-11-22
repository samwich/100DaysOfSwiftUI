//
//  ContentView.swift
//  Animations
//
//  Created by Sam Johnson on 2022-11-21.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        print(animationAmount)
        
        return Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 2)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x:0, y:1, z:0))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
