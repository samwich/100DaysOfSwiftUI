//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Sam Johnson on 2022-12-14.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
