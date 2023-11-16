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
    @State private var feedback = UINotificationFeedbackGenerator()
    
    @State private var rollAnimationRunning = false
    @State private var rollAnimationCounter = 0
    let rollAnimationTimer = Timer.publish(every: 0.2,tolerance: 0.03, on: .main, in: .common).autoconnect()

    let diceCounts = Array(1...10)
    let diceSides = [4, 6, 8, 10, 12, 20, 100]
    
    private var recentRolls: [Roll] {
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
            
            List {
                ForEach(recentRolls) { roll in
                    RollView(roll: roll)
                }
            }
            .onReceive(rollAnimationTimer) { time in
                if rollAnimationRunning {

                    let r = Roll(diceCounts[diceCountsIndex], d: diceSides[sidesIndex])
                    
                    if rollAnimationCounter == 0 {
                        withAnimation {
                            rolls.append(r)
                        }
                        rollAnimationCounter += 1
                    } else if rollAnimationCounter >= 5 {
                        rollAnimationRunning = false
                        rollAnimationCounter = 0
                        RollStorageManager.save(rolls: rolls)
                    } else {
                        rolls[rolls.count - 1] = r
                        rollAnimationCounter += 1
                    }
                }
            }
        }
        .padding()
    }
    
    func roll() {
        feedback.notificationOccurred(.error)
        rollAnimationRunning = true
    }
}

#Preview {
    ContentView()
}
