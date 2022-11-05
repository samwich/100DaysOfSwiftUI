import Foundation

// 100 Days of SwiftUI Checkpoint 8

protocol Building {
    var rooms: Int {get set}
    var cost: Int {get set}
    var agent: String {get set}
    func salesSummary() -> Void
    
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    
    func salesSummary() {
        print("House with \(rooms) rooms, costs $\(cost), sold by \(agent)")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    
    func salesSummary() {
        print("Office with \(rooms) rooms, costs $\(cost), sold by \(agent)")
    }
}

let h = House(rooms: 5, cost: 100_000, agent: "Alice")
let o = Office(rooms: 3, cost: 110_000, agent: "Bob")
h.salesSummary()
o.salesSummary()

