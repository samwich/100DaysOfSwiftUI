//
//  ContentView.swift
//  GeometryAndLayout
//
//  Created by Sam Johnson on 2023-10-04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {

            Text(".center")
            HStack(alignment: .center) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            .border(.black, width: 1)
            
            Text(".firstTextBaseline")
            HStack(alignment: .firstTextBaseline) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            .border(.black, width: 1)
            
            Text(".lastTextBaseline")
            HStack(alignment: .lastTextBaseline) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            .border(.black, width: 1)
            
            Text("Live long and prosper")
                .frame(width: 300, height: 100, alignment: .topLeading)
                .offset(x: 50, y: 50)
                .border(.black, width: 1)

            VStack(alignment: .leading) {
                Text("Hello, world!")
                    .alignmentGuide(.leading) { d in
                        d[.trailing]
                    }
                Text("This is a longer line of text")
            }
            .background(.red)
            .padding()
            .frame(width: 400)
            .background(.blue)
            .border(.black, width: 1)
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { position in
                    Text("Number \(position)")
                        .alignmentGuide(.leading) { _ in
                            Double(position) * -10
                        }
                }
            }
            .background(.red)
            .padding()
            .frame(width: 400)
            .background(.blue)
            .border(.black, width: 1)
            
        }
    }
}

#Preview {
    ContentView()
}
