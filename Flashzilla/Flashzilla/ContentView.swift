//
//  ContentView.swift
//  Flashzilla
//
//  Created by Sam Johnson on 2023-09-22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack {
            Text("Hello")
                .onChange(of: scenePhase) { newValue in
                    if newValue == .active {
                        print("Active")
                    } else if newValue == .inactive {
                        print("Inactive")
                    } else if newValue == .background {
                        print("Background")
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
