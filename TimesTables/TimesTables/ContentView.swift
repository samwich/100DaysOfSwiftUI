//
//  ContentView.swift
//  TimesTables
//
//  Created by Sam Johnson on 2022-11-23.
//

import SwiftUI

struct ContentView: View {
    let possibleOperands = 2...12
    let questionCountOptions = [2, 5, 10, 20]

    @State private var lowestOperand = 2
    @State private var highestOperand = 2
    @State private var questionCount = 2
    
    @State private var gameInProgress = false
    @State private var showingResult = false
    @State private var showingSummary = false
        
    @State private var round = 0
    @State private var question = (0,0)
    @State private var answer: Int?
    @FocusState private var answerInputIsFocused: Bool

    var body: some View {
        NavigationView {
            if !gameInProgress {
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
                        gameInProgress = true
                        nextQuestion()
                    }
                }
                .navigationTitle("Times Tables")
            } else {
                Form {
                    Text("Question \(round)")
                    Text("What is _ x _ ?")
                    TextField("Answer", value: $answer, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($answerInputIsFocused)
                    Button("OK") {
                        //                            answerInputIsFocused = false
                        showingResult = true
                    }
                }
                .navigationTitle("Question \(round)")
                .alert("Result", isPresented: $showingResult) {
                    Button("Next", action: nextQuestion)
                } message: {
                    Text("the correct answer was TODO")
                }
                .alert("Practice Summary", isPresented: $showingSummary) {
                    Button("Next") {
                        gameInProgress = false
                    }
                } message: {
                    Text("You got TODO questions correct!")
                }
            }
        }
    }
    
    func newGame() {
        gameInProgress = true
    }
    
    func nextQuestion() {
        if round >= questionCount {
            showingSummary = true
        } else {
            round += 1
            answer = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
