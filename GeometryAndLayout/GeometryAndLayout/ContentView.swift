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
        HStack(alignment: .midAccountAndName) {
            VStack {
                Color.red.frame(height: 1)
                ZStack {
                    Color.blue.frame(height: 1)
                    Text("@twostraws")
                        .alignmentGuide(.midAccountAndName) { $0[VerticalAlignment.center] }
                }
                Color.red.frame(height: 1)
                Image(.gruelEater)
                    .resizable()
                    .frame(width: 90, height: 90)
                Text("hello")
                    .font(.caption)
                Text("hello")
                    .font(.caption)
                Text("hello")
                    .font(.caption)
            }
            .frame(width: 100)
            
            VStack {
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
                Color.red.frame(height: 1)
                ZStack {
                    Color.blue.frame(height: 1)
                    Text("PAUL HUDSON")
                        .alignmentGuide(.midAccountAndName) { $0[VerticalAlignment.center] }
                        .font(.largeTitle)
                }
                Color.red.frame(height: 1)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
