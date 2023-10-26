//
//  RollView.swift
//  Dice
//
//  Created by Sam Johnson on 2023-10-25.
//

import SwiftUI

struct RollView: View {
    @State var roll: Roll
    
    var body: some View {
        HStack {
            Text("\(roll.count)d\(roll.sides): ")
                .font(.title)
            
            Spacer()
            
            Text("\(roll.results.map {String($0)}.joined(separator: ", "))")
                .padding(5)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 10))
            
            Spacer()
            
            Text(": \(roll.total())")
                .font(.title)
        }
    }
}

#Preview {
    RollView(roll: Roll.example)
}
