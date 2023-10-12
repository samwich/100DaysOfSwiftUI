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
        VStack {
            GeometryReader { fullHelix in
                ScrollView {
                    ForEach(0..<50) { i in
                        GeometryReader { geoItem in
                            Text("Row \(i)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .background(colors[i % colors.count])
                                .rotation3DEffect(
                                    .degrees(geoItem.frame(in: .global).minY - fullHelix.size.height / 2) / 5,
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                        }
                        .frame(height: 40)
                    }
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(1..<20) { num in
                        GeometryReader { geo in
                            Text("Album \(num)")
                                .font(.largeTitle)
                                .padding()
                                .background(.red)
                                .border(.black)
                                .rotation3DEffect(
                                    .degrees(-geo.frame(in: .global).minX) / 8,
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                                .frame(width: 200, height: 100)
                                .border(.purple)
                        }
                        .frame(width: 200, height: 120)
                    }
                }
            }
            .border(.blue)
            
        }
    }
}

#Preview {
    ContentView()
}
