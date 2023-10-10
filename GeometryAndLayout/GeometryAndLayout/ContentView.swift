//
//  ContentView.swift
//  GeometryAndLayout
//
//  Created by Sam Johnson on 2023-10-04.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top of outer")
            InnerView()
                .background(.green)
            Text("Bottom of outer")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Text in Inner Geo Reader \(Int(geo.frame(in: .global).midX))")
                    .background(.blue)
                    .onTapGesture {
                        let g = geo.frame(in: .global)
                        let c = geo.frame(in: .named("Custom OuterView"))
                        let l = geo.frame(in: .local)
                        
                        print("GeometryReader's center in various coordinateSpaces:")
                        print("Global:    (\(Int(g.midX)), \(Int(g.midY)))")
                        print("OuterView: (\(Int(c.midX)), \(Int(c.midY)))")
                        print("Local:     (\(Int(l.midX)), \(Int(l.midY)))")
                        print("GeometryReader's frame in various coordinateSpaces:")
                        print("Global:    (\(Int(g.minX)), \(Int(g.minY))) - (\(Int(g.maxX)), \(Int(g.maxY)))")
                        print("OuterView: (\(Int(c.minX)), \(Int(c.minY))) - (\(Int(c.maxX)), \(Int(c.maxY)))")
                        print("Local:      (\(Int(l.minX)),  \(Int(l.minY))) - (\(Int(l.maxX)), \(Int(l.maxY)))")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct ContentView: View {
    var body: some View {
//        GeometryReader { g1 in
//            VStack {
//                Text("Outside of OuterView, global midX is \(Int(g1.frame(in: .global).midX))")
                OuterView()
                    .background(.red)
                    .coordinateSpace(name: "Custom OuterView")
//            }
//        }
    }
}

#Preview {
    ContentView()
}
