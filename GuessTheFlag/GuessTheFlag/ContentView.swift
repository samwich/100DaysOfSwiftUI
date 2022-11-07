//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sam Johnson on 2022-11-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            ForEach(0..<3) { i in
                Spacer()
                HStack {
                    ForEach(0..<3) { j in
                        Spacer()
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Text("\(i * 3 + j + 1)")
                    }
                    Spacer()
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
