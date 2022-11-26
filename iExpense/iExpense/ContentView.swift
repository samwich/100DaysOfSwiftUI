//
//  ContentView.swift
//  iExpense
//
//  Created by Sam Johnson on 2022-11-25.
//

import SwiftUI

struct ContentView: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("Tap") private var tapCount = 0

    var body: some View {
        VStack {
            Button("Tap count: \(tapCount)") {
                tapCount += 1
                UserDefaults.standard.set(tapCount, forKey: "Tap")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
