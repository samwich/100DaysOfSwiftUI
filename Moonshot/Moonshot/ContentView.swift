//
//  ContentView.swift
//  Moonshot
//
//  Created by Sam Johnson on 2022-11-26.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText: \(text)")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(1..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
