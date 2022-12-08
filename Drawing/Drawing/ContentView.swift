//
//  ContentView.swift
//  Drawing
//
//  Created by Sam Johnson on 2022-11-30.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    var gradientOriginX: Double
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.2)
                            ],
                            startPoint: UnitPoint(x: gradientOriginX, y: 0.0),
                            endPoint: UnitPoint(x: 1.0 - gradientOriginX, y: 1.0)
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct Arrow: InsettableShape {
    var insetAmount = 0.0
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let barbWidthOffset = rect.maxX * 0.1
        let shaftWidthOffset = rect.maxX * 0.125

        path.move(to: CGPoint(x: rect.midX, y: rect.minY + insetAmount)) // arrow point
        path.addLine(to: CGPoint(x: rect.maxX - barbWidthOffset - insetAmount, y: rect.midY)) // right barb
        path.addLine(to: CGPoint(x: rect.midX + shaftWidthOffset, y: rect.midY)) // right shoulder
        path.addLine(to: CGPoint(x: rect.midX + shaftWidthOffset, y: rect.maxY - insetAmount)) // right bottom
        path.addLine(to: CGPoint(x: rect.midX - shaftWidthOffset, y: rect.maxY - insetAmount)) // left bottom
        path.addLine(to: CGPoint(x: rect.midX - shaftWidthOffset, y: rect.midY)) // left shoulder
        path.addLine(to: CGPoint(x: rect.minX + barbWidthOffset + insetAmount, y: rect.midY)) // left barb
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + insetAmount)) // arrow point

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var shape = self
        shape.insetAmount += amount
        return shape
    }
}

struct ContentView: View {
    @State private var arrowBorderWidth: CGFloat = 20
    @State private var rectangleGradientX = 0.5

    var body: some View {
        VStack {
            Arrow()
                .strokeBorder(
                    .red,
                    style: StrokeStyle(lineWidth: arrowBorderWidth, lineCap: .round, lineJoin: .round)
                )
                .padding()

            Text(arrowBorderWidth.formatted())
            Button("Change Border") {
                withAnimation {
                    arrowBorderWidth = arrowBorderWidth == 20.0 ? 50.0 : 20.0
                }
            }

            ColorCyclingRectangle(gradientOriginX: rectangleGradientX)
                .padding()

            Text(rectangleGradientX.formatted())
            Slider(value: $rectangleGradientX)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
