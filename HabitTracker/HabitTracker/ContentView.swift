//
//  ContentView.swift
//  HabitTracker
//
//  Created by Sam Johnson on 2022-12-10.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var newHabitShowing = false

    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink {
                    Text("Brush teeth detail")
                    Text("You've completed Brush teeth 0 times.")
                    Button("I did it!") {}
                } label: {
                    Text("Brush teeth")
                        .font(.headline)
                }
                NavigationLink {
                    Text("item detail!")
                } label: {
                    Text("Exercise")
                }
                NavigationLink {
                    Text("item detail!")
                } label: {
                    Text("Drink water")
                }
                ForEach(activities.items) { item in
                    NavigationLink {
                        ActivityDetailView(activity: item)
                    } label: {
                        Text(item.name)
                            .font(.headline)
                    }
                }
            }
            .sheet(isPresented: $newHabitShowing) {
                AddHabitView(activities: activities)
            }
            .padding()
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItemGroup {
                    Button("New Habit") {
                        newHabitShowing = true
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
