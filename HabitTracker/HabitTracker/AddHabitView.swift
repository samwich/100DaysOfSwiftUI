//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Sam Johnson on 2022-12-10.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    TextField("Name", text: $name)
                }
                Section("Description") {
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let activity = Activity(name: name, description: description)
                    activities.items.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
//    let activites = [Activity(name: "a name", description: "a desc")]
    
    static var previews: some View {
        AddHabitView(activities: Activities())
    }
}
