//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Sam Johnson on 2023-02-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement()
        .accessibilityLabel("Your score is 999")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
