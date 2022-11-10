//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sam Johnson on 2022-11-10.
//

import SwiftUI

struct ContentView: View {
    let possibleMoves = ["Rock", "Paper", "Scissors"]
    let maxTurns = 10
    @State private var turnNumber = 0
    @State private var score = 0
    @State private var appMove = Int.random(in: 0...2)
    @State private var turnGoal = Bool.random()

    
    var body: some View {
        VStack {
            Text("Rock, Paper, Scissors")
                .font(.largeTitle)
            Spacer()
            Text("Score: \(score)")
                .font(.largeTitle)
            Spacer()
            Text("Opponent's move: \(possibleMoves[appMove])")
                .font(.largeTitle)
            Spacer()
            Text("Try to: \(turnGoal ? "Win" : "Lose")")
                .font(.largeTitle)
            Spacer()
            ForEach(possibleMoves, id: \.self) { move in
                Button(move) {}
                    .font(.largeTitle)
                Spacer()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
