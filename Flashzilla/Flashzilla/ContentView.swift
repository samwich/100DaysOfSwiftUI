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
                .rotationEffect(currentAmount + finalAmount)
                .gesture(
                    RotationGesture()
                        .onChanged({ angle in
                            currentAmount = angle
                        })
                        .onEnded({ angle in
                            finalAmount += currentAmount
                            currentAmount = .zero
                        })
                )
//                .scaleEffect(currentAmount + finalAmount)
//                .gesture(
//                    MagnificationGesture()
//                        .onChanged({ amount in
//                            currentAmount = amount - 1
//                        })
//                        .onEnded({ amount in
//                            finalAmount += currentAmount
//                            currentAmount = 0
//                        })
//                )
//                .onTapGesture(count: 2) {
//                    print("Double tapped!")
//                }
//                .onTapGesture {
//                    print("Tapped!")
//                }
//                .onLongPressGesture(minimumDuration: 2) {
//                    print("Long pressed!")
//                } onPressingChanged: { inProgress in
//                    print("In progress \(inProgress)!")
//                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
