//
//  ContentView.swift
//  TimesTables
//
//  Created by Sam Johnson on 2022-11-23.
//

import SwiftUI

struct Game {
    var round = 0
    var score = 0
    var lowestOperand: Int
    var highestOperand: Int
    var questionCount: Int
    var questions: [Question] = []
    
    init(lowestOperand: Int = 2, highestOperand: Int = 2, questionCount: Int = 2) {
        self.lowestOperand = lowestOperand
        self.highestOperand = highestOperand
        self.questionCount = questionCount
        
        for _ in 1...questionCount {
            questions.append(
                Question(
                    a: Int.random(in: lowestOperand...highestOperand),
                    b: Int.random(in: lowestOperand...highestOperand)
                )
            )
        }
    }
}

struct Question {
    var a: Int
    var b: Int
    var answer: Int?
    
    var questionText: String {
        "What is \(a)x\(b)?"
    }
    
    var correctAnswer: Int {
        a * b
    }
    
    var score: Int {
        answer == correctAnswer ? 1 : 0
    }
}

struct ContentView: View {
    @State private var game = Game()
    
    @State private var gameInProgress = false
    @State private var showingResult = false
    @State private var resultTitle = ""
    @State private var resultMessage = ""
    @State private var showingSummary = false
        
    @State private var question = Question(a: 0, b: 0)
//    @State private var answer: Int?
    @FocusState private var answerInputIsFocused: Bool
    
    var body: some View {
        NavigationView {
            if !gameInProgress {
                GameSettingsView(startGame: playGame)
            } else {
                QuestionView(game: $game, checkAnswer: checkAndScoreAnswer)
                    .alert(resultTitle, isPresented: $showingResult) {
                        Button("Next", action: nextQuestion)
                    } message: {
                        Text(resultMessage)
                    }
                    .alert("Practice Summary", isPresented: $showingSummary) {
                        Button("Next") {
                            gameInProgress = false
                        }
                    } message: {
                        Text("You got \(game.score) questions correct!")
                    }
            }
        }
    }
    
    func playGame(low: Int, high: Int, rounds: Int) {
        game = Game(lowestOperand: low, highestOperand: high, questionCount: rounds)
        nextQuestion()
        gameInProgress = true
        
    }
    
    func nextQuestion() {
        if game.round >= game.questionCount {
            showingSummary = true
        } else {
            game.round += 1
            question = game.questions[game.round - 1]
        }
    }
    
    func checkAndScoreAnswer(a: Int?) {
        if a == game.questions[game.round - 1].correctAnswer {
            game.score += 1
            resultTitle = "Correct!"
            resultMessage = "+1 to your score"
        } else {
            resultTitle = "Incorrect"
            resultMessage = "You answered \(a?.formatted() ?? ""), the correct answer was \(question.correctAnswer)"

        }
        answerInputIsFocused = false
        showingResult = true
    }
}

struct GameSettingsView: View {
    var startGame: (Int, Int, Int) -> ()
    
    let possibleOperands = 2...12
    let questionCountOptions = [2, 5, 10, 20]
    
    @State private var lowestOperand = 2
    @State private var highestOperand = 2
    @State private var questionCount = 2

    var body: some View {
        Form {
            Text("Game Setup")
            Stepper("Highest Operand \(highestOperand)", value: $highestOperand, in: possibleOperands)
            Picker("Question count", selection: $questionCount) {
                ForEach(questionCountOptions, id: \.self) { item in
                    Text(item.formatted())
                }
            }
            .pickerStyle(.segmented)
            Button("Begin") {
                startGame(lowestOperand, highestOperand, questionCount)
            }
        }
        .navigationTitle("Times Tables")
    }
}

struct QuestionView: View {
    @Binding var game: Game
    var checkAnswer: (Int?) -> ()
    
    @FocusState private var answerInputIsFocused: Bool

    var body: some View {
        Form {
            Text("Question \(game.round)")
            Text(game.questions[game.round - 1].questionText)
            TextField("Answer", value: $game.questions[game.round - 1].answer, format: .number)
                .keyboardType(.decimalPad)
                .focused($answerInputIsFocused)
            Button("OK") {
                checkAnswer(game.questions[game.round - 1].answer)
            }
        }
        .navigationTitle("Question \(game.round)")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
