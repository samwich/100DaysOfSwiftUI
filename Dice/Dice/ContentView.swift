//
//  ContentView.swift
//  Dice
//
//  Created by Sam Johnson on 2023-10-13.
//

import SwiftUI

struct ContentView: View {
    @State private var diceCountsIndex = 1
    @State private var sidesIndex = 1
    @State private var rolls = RollStorageManager.load()
    
    let diceCounts = Array(1...10)
    let diceSides = [4, 6, 8, 10, 12, 20, 100]
    
    var recentRolls: [Roll] {
        let c = min(5, rolls.count)
        return Array(rolls.reversed()[0..<c])
    }
    
    var body: some View {
        VStack {
            Text("Dice")
                .font(.title)
            
            HStack {
                Picker(selection: $diceCountsIndex) {
                    ForEach(0..<diceCounts.count, id: \.self) { i in
                        Text("\(diceCounts[i])")
                            .font(.title)
                    }
                } label: {
                    Text("Number of Dice")
                }
                
                Text("d")
                
                Picker(selection: $sidesIndex) {
                    ForEach(0..<diceSides.count, id: \.self) { i in
                        Text("\(diceSides[i])")
                    }
                } label: {
                    Text("Number of Sides")
                }
            }
            
            Button("Roll!", action: roll)
            
            Form {
                ForEach(recentRolls) { roll in
                    RollView(roll: roll)
                }
            }
        }
        .padding()
    }
    
    func roll() {
        let r = Roll(diceCounts[diceCountsIndex], d: diceSides[sidesIndex])
        rolls.append(r)
        RollStorageManager.save(rolls: rolls)
    }
}

#Preview {
    ContentView()
}
