//
//  ContentView.swift
//  Flashzilla
//
//  Created by Sam Johnson on 2023-09-22.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text("Hello")
                .onReceive(timer) { time in
                    if counter == 5 {
                        timer.upstream.connect().cancel()
                    } else {
                        print("The time is now \(time)")
                    }
                    counter += 1
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
