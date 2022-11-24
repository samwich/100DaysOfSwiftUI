//
//  ContentView.swift
//  TimesTables
//
//  Created by Sam Johnson on 2022-11-23.
//

import SwiftUI

struct ContentView: View {
    @State private var lowestOperand = 2
    @State private var highestOperand = 2
    @State private var questionCount = 2
    
    @State private var gameInProgress = false
    @State private var showingResult = false
    @State private var showingSummary = false
        
    @State private var round = 0
    @State private var score = 0
    @State private var question = (0, 0)
    @State private var answer: Int?
    @FocusState private var answerInputIsFocused: Bool
    
    var body: some View {
        NavigationView {
            if !gameInProgress {
                GameSettingsView(startGame: playGame)
            } else {
                QuestionView(round: round, question: question, checkAnswer: checkAndScoreAnswer)
                    .alert("Result", isPresented: $showingResult) {
                        Button("Next", action: nextQuestion)
                    } message: {
                        Text("You answered \(answer?.formatted() ?? ""), the correct answer was \(question.0 * question.1)")
                    }
                    .alert("Practice Summary", isPresented: $showingSummary) {
                        Button("Next") {
                            gameInProgress = false
                        }
                    } message: {
                        Text("You got \(score) questions correct!")
                    }
            }
        }
    }
    
    func playGame(low: Int, high: Int, rounds: Int) {
        lowestOperand = low
        highestOperand = high
        questionCount = rounds
        round = 0
        score = 0
        nextQuestion()
        gameInProgress = true
        
    }
    
    func nextQuestion() {
        if round >= questionCount {
            showingSummary = true
        } else {
            round += 1
            answer = nil
            question = (Int.random(in: lowestOperand...highestOperand), Int.random(in: lowestOperand...highestOperand))
        }
    }
    
    func checkAndScoreAnswer(a: Int?) {
        answer = a
        let correctAnswer = question.0 * question.1
        if a == correctAnswer {
            score += 1
        }
        answerInputIsFocused = false
        showingResult = true
    }
}

struct GameSettingsView: View {
    var startGame: (_ lowOperand: Int, _ highOperand: Int, _ questionCount: Int) -> ()
    
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
    var round: Int
    var question: (Int, Int)
    var checkAnswer: (Int?) -> ()
    
    @State var answer: Int?
    @FocusState private var answerInputIsFocused: Bool

    var body: some View {
        VStack {
            Text("Question \(round)")
            Text("What is \(question.0) x \(question.1) ?")
            TextField("Answer", value: $answer, format: .number)
                .keyboardType(.decimalPad)
                .focused($answerInputIsFocused)
            Button("OK") {
                checkAnswer(answer)
            }
        }
        .navigationTitle("Question \(round)")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
