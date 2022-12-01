//
//  ContentView.swift
//  Drawing
//
//  Created by Sam Johnson on 2022-11-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
//                path.closeSubpath()
            }
//            .fill(.blue)
//            .stroke(.blue, lineWidth: 10)
            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
