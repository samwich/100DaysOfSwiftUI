//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sam Johnson on 2022-11-07.
//

import SwiftUI

struct FlagImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    let maxRounds = 8
    @State private var showingGameSummary = false
    @State private var round = 1
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "Ukraine": "Flag with two horizontal stripes of equal size. Top stripe blue, bottom stripe yellow",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]

    @State private var tappedButton: Int? = nil

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                .init(color: .white, location: 4)
            ], center: .top, startRadius: 200, endRadius: 800)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Choose the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Round: \(round) of \(maxRounds). Score: \(score). Choose the flag of \(countries[correctAnswer]).")
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(image: countries[number])
                        }
                        .rotation3DEffect(
                            .degrees(number == tappedButton ? 360 : 0),
                            axis: (x: 0, y:1, z:0)
                        )
                        .opacity( (tappedButton == nil) || (tappedButton == number) ? 1 : 0.25)
                        .blur(radius: (tappedButton == nil) || (tappedButton == number) ? 0 : 5)
                        .animation(.default, value: tappedButton)
                        .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()

                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
                
                Text("Round: \(round)/\(maxRounds)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                    .accessibilityLabel("Round: \(round) of \(maxRounds)")
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game over!", isPresented: $showingGameSummary) {
            Button("Play Again", action: newGame)
        } message: {
            Text("You scored \(score) out of \(maxRounds)")
        }
    }
    
    func flagTapped(_ number: Int) {
        tappedButton = number

        if number == correctAnswer {
            scoreTitle = "Correct! That's the flag of \(countries[number])"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        
        if round < maxRounds {
            showingScore = true
        } else {
            showingGameSummary = true
        }
    }
    
    func askQuestion() {
        tappedButton = nil
        round += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func newGame() {
        round = 0
        score = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
