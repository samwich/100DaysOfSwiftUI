//
//  ContentView.swift
//  GeometryAndLayout
//
//  Created by Sam Johnson on 2023-10-04.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullHelix in
            ScrollView {
                ForEach(0..<50) { i in
                    GeometryReader { geoItem in
                        Text("Row \(i)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[i % colors.count])
                            .opacity(geoItem.frame(in: .global).midY / 200)
                            .rotation3DEffect(
                                .degrees(geoItem.frame(in: .global).minY - fullHelix.size.height / 2) / 5,
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
