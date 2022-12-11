//
//  Activity.swift
//  HabitTracker
//
//  Created by Sam Johnson on 2022-12-10.
//

import Foundation

struct Activity: Identifiable {
    var id = UUID()
    let name: String
    let description: String
    var completionCount = 0
}
