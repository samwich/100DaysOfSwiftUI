//
//  ContentView.swift
//  GeometryAndLayout
//
//  Created by Sam Johnson on 2023-10-04.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
            ZStack {

                // .position() takes all available space offered to achieve its goal
                Text("Hello, world! .position()")
                    .position(x: 100, y: 60)
                    .border(.blue, width: 3)

                Text("Hello, world! .position()")
                    .background(.red)
                    .border(.black)
                    .position(x: 100, y: 100)

                Text("Hello, world! .offset()")
                    .offset(x: 50, y: 10)
                    .background(.orange)
                    .border(.black)

                Text("Hello, world! .offset()")
                    .border(.black)
                    .background(.yellow)
                    .offset(x: 80, y: 200)
                
            }
        .padding()
    }
}

#Preview {
    ContentView()
}
