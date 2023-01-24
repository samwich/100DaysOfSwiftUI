//
//  Location.swift
//  BucketList
//
//  Created by Sam Johnson on 2023-01-24.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
