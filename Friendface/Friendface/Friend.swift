//
//  Friend.swift
//  Friendface
//
//  Created by Sam Johnson on 2022-12-20.
//

import Foundation

struct Friend: Identifiable, Codable {
    let id: UUID
    let name: String
}
