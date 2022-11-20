//
//  ContentView.swift
//  WordScramble
//
//  Created by Sam Johnson on 2022-11-19.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]

    var body: some View {
        Text("hello")
    }
    
    func test() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        
        let input2 = """
                     a
                     b
                     c
                     """
        let letters2 = input2.components(separatedBy: "\n")
        
        let letter = letters.randomElement()
        
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allCorrect = misspelledRange.location == NSNotFound
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
