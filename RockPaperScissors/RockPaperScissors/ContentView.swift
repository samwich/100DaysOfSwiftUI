//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sam Johnson on 2022-11-10.
//

import SwiftUI

struct MoveLabel: View {
    var text: String
    
    let stringToEmoji = [
        "Rock": "🪨",
        "Paper": "📜",
        "Scissors": "✂️"
    ]

    var body: some View {
        Text(text + (stringToEmoji[text] ?? ""))
    }
}

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
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle)
                Spacer()
                Text("Score: \(score)")
                    .font(.largeTitle)
                Spacer()
                Group {
                    Text("Opponent's move:")
                    MoveLabel(text: possibleMoves[appMove])
                }
                .font(.largeTitle)
                Spacer()
                Group {
                    Text("Try to:")
                    Text("\(turnGoal ? "Win 🙆" : "Lose 🙅")")
                }
                .font(.largeTitle)
                Spacer()
                ForEach(0..<3) { playerMove in
                    Button {
                        optionTapped(playerMove)
                    } label: {
                        MoveLabel(text: possibleMoves[playerMove])
                    }
                    .font(.largeTitle)
                    .frame(width: 200, height: 75)
                    .background(Color(.lightGray))
                    .clipShape(Capsule())
                }
                Spacer()
            }
            .padding()
        }
        .alert("Game Over", isPresented: $showingSummary) {
            Button("Play again", action: newGame)
        } message: {
            Text("Final score: \(score)")
        }
    }

    func newGame() {
        turnNumber = 1
        score = 0
        appMove = Int.random(in: 0...2)
        turnGoal = Bool.random()
    }
    
    func optionTapped(_ playerMove: Int) {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
