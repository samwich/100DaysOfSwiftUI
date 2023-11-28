//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Sam Johnson on 2023-11-27.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            Text("Plesase sleect a resort from the lett-hand menu; swipe from the left edge to show it.")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
