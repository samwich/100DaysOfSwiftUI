//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Sam Johnson on 2022-12-20.
//

import SwiftUI

@main
struct FriendfaceApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
