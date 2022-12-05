//
//  ContentView.swift
//  Drawing
//
//  Created by Sam Johnson on 2022-11-30.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
//        Text("Hello World")
//            .frame(width: 300, height: 300)
//            .border(ImagePaint(image: Image("Example"), scale: 0.2), width: 50)
//        Text("Hello World")
//            .frame(width: 300, height: 300)
//            .border(
//                ImagePaint(
//                    image: Image("Example"),
//                    sourceRect: CGRect(x: 0.1, y: 0.15, width: 0.70, height: 0.5),
//                    scale: 0.15
//                ),
//                width: 50
//            )
        Capsule()
            .strokeBorder(
                ImagePaint(
                    image: Image("Example"),
                    sourceRect: CGRect(x: 0.1, y: 0.15, width: 0.70, height: 0.5),
                    scale: 0.15
                ),
                lineWidth: 30
            )
            .frame(width: 300, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
