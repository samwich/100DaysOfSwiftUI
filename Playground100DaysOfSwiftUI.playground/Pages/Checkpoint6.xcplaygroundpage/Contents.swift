import Cocoa

// 100 Days of SwiftUI Checkpoint 6

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear = 0
    let lowestGear: Int
    let highestGear: Int
    
    init(model: String, seats: Int, lowGear: Int, highGear: Int) {
        self.model = model
        numberOfSeats = seats
        lowestGear = lowGear
        highestGear = highGear
    }
    
    mutating func changeGear(to gear: Int) -> Bool {
        if lowestGear <= gear && gear <= highestGear {
            currentGear = gear
            return true
        } else {
            return false
        }
    }
}

//var c = Car(model: "Toyota", seats: 5, lowGear: -1, highGear: 6)
//c.changeGear(to: 7) == false
//c.changeGear(to: -1)
//c.changeGear(to: 3)
//c.currentGear

