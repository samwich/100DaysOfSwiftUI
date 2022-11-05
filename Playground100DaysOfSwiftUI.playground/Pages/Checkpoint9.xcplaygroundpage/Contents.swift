import Foundation

// 100 Days of SwiftUI Checkpoint 9

func optionalRandom(from ints: [Int]?) -> Int { return (ints?.randomElement()) ?? Int.random(in: 1...100) }

let numbers = [-1,-2,-3]
optionalRandom(from: numbers)
let noNumbers: [Int]? = nil
optionalRandom(from: noNumbers)
