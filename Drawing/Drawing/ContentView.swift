//
//  ContentView.swift
//  Drawing
//
//  Created by Sam Johnson on 2022-11-30.
//

import SwiftUI

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(Double(rows), Double(columns)) }
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
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
    @State private var rows = 4
    @State private var columns = 4
    @State private var arrowBorderWidth: CGFloat = 20

    var body: some View {
        VStack {
            Arrow()
                .strokeBorder(
                    .red,
                    style: StrokeStyle(lineWidth: arrowBorderWidth, lineCap: .round, lineJoin: .round)
                )
                .padding()
            Button("Change Border") {
                withAnimation {
                    arrowBorderWidth = arrowBorderWidth == 20.0 ? 50.0 : 20.0
                }
            }
            Checkerboard(rows: rows, columns: columns)
                .onTapGesture {
                    withAnimation(.linear(duration: 3)) {
                        rows = 8
                        columns = 16
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
