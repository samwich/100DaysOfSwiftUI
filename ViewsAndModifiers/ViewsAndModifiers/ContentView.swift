//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Sam Johnson on 2022-11-09.
//

import SwiftUI

struct ContentView: View {
    var motto1: some View {
        Text("Foo")
    }
    let motto2 = Text("Bar")

    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            spells
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
