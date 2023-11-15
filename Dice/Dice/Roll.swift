//
//  Roll.swift
//  Dice
//
//  Created by Sam Johnson on 2023-10-25.
//

import Foundation

struct Roll: Codable, Identifiable {
    var id = UUID()
    let count: Int
    let sides: Int
    let results: [Int]
    
    init(_ count: Int, d: Int) {
        self.count = count
        self.sides = d
        self.results = (0..<count).map { _ in .random(in: 1...d) }
    }

    var total: Int {
        results.reduce(0, +)
    }
    
    static let example = Roll(2, d: 6)
}
