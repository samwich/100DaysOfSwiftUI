//
//  Order.swift
//  CupcakeCorner
//
//  Created by Sam Johnson on 2022-12-13.
//

import Foundation

@dynamicMemberLookup
class OrderWrapper: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    @Published var order = Order()
    
    subscript<T>(dynamicMember keyPath: KeyPath<Order, T>) -> T {
        order[keyPath: keyPath]
    }
    
    subscript<T>(dynamicMember keyPath: WritableKeyPath<Order, T>) -> T {
        get {
            order[keyPath: keyPath]
        }
        
        set {
            order[keyPath: keyPath] = newValue
        }
    }
}

struct Order: Codable {
    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        for field in [name, streetAddress, city, zip] {
            if field.trimmingCharacters(in: .whitespaces).isEmpty {
                return false
            }
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more - this is distracting
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
