//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sam Johnson on 2022-11-10.
//

import SwiftUI

struct ContentView: View {
    let possibleMoves = ["Rock", "Paper", "Scissors"]
    let winningMoves = ["Scissors", "Rock", "Paper"]
    let losingMoves = ["Paper", "Scissors", "Rock"]
    let maxTurns = 10
    @State private var turnNumber = 1
    @State private var score = 0
    @State private var appMove = Int.random(in: 0...2)
    @State private var turnGoal = Bool.random()
    @State private var showingSummary = false
    
    func newGame() {
        turnNumber = 1
        score = 0
        appMove = Int.random(in: 0...2)
        turnGoal = Bool.random()
    }
    
    var body: some View {
        VStack {
            Text("Rock, Paper, Scissors")
                .font(.largeTitle)
            Spacer()
            Text("Score: \(score)")
                .font(.largeTitle)
            Spacer()
            Text("Opponent's move:")
                .font(.largeTitle)
            Text(possibleMoves[appMove])
                .font(.largeTitle)
            Spacer()
            Text("Try to: \(turnGoal ? "Win" : "Lose")")
                .font(.largeTitle)
            Spacer()
            ForEach(0..<3) { playerMove in
                Button(possibleMoves[playerMove]) {
                    
                    if turnGoal && winningMoves[playerMove] == possibleMoves[appMove] {
                        score += 1
                    } else if !turnGoal && losingMoves[playerMove] == possibleMoves[appMove] {
                        score += 1
                    } else {
                        score -= 1
                    }
                    
                    if turnNumber < maxTurns {
                        turnGoal.toggle()
                        appMove = Int.random(in: 0...2)
                        turnNumber += 1
                    } else {
                        showingSummary.toggle()
                    }
                }
                .font(.largeTitle)
                Spacer()
            }
        }
        .alert("Game Over", isPresented: $showingSummary) {
            Button("Play again", action: newGame)
        } message: {
            Text("Final score: \(score)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
