//
//  CardManager.swift
//  Flashzilla
//
//  Created by Sam Johnson on 2023-10-02.
//

struct CardManager {
    static let savePath = FileManager.documentsDirectory.appendingPathComponent("FlashzillaCards")
    
    static func load() -> [Card] {
        do {
            let data = try Data(contentsOf: savePath)
            return try JSONDecoder().decode([Card].self, from: data)
        } catch {
            print("Unable to load cards.")
        }
        
        return []
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
