//
//  Flashzilla.swift
//  Flashzilla
//
//  Created by Sam Johnson on 2023-09-25.
//

import Foundation

struct Card: Codable, Identifiable, Hashable {
    var id = UUID()
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}

class CardManager {
    static let savePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("FlashzillaCards")
    
    static func load() -> [Card] {
        var cards = [Card]()
        do {
            let data = try Data(contentsOf: savePath)
            cards = try JSONDecoder().decode([Card].self, from: data)
        } catch {
            print("Unable to load cards.")
        }
        return cards
    }
    
    static func save(cards: [Card]) {
        do {
            let encoded = try JSONEncoder().encode(cards)
            try encoded.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save cards to savePath.")
        }
    }
}
