//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sam Johnson on 2022-11-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AngularGradient(gradient: Gradient(colors: [
            .orange, .red, .orange, .orange, .yellow, .orange, .orange
        ]), center: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
