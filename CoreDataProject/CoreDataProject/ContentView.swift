//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Sam Johnson on 2022-12-16.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "S"
    @State private var filterPredicate = MyPredicate.contains
    @State private var sortBy: [SortDescriptor<Singer>] = [SortDescriptor(\.lastName)]
        
    let letters = ["A", "I", "S"]
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterPredicate: filterPredicate, filterValue: lastNameFilter, sortDescriptors: sortBy) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Section("Last name") {
                Picker("Predicate", selection: $filterPredicate) {
                    ForEach(MyPredicate.allCases, id: \.self) {predicate in
                        Text(predicate.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                Picker("Letter", selection: $lastNameFilter) {
                    ForEach(letters, id: \.self) { letter in
                        Text(letter)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Sort by") {
                Button("First Name") {
                    withAnimation {
                        sortBy = [SortDescriptor(\.firstName)]
                    }
                }
                Button("Last Name") {
                    withAnimation {
                        sortBy = [SortDescriptor(\.lastName)]
                    }
                }
            }
            
            Section("Setup") {
                Button("Add Examples") {
                    let x = Singer(context: moc)
                    x.firstName = "Taylor"
                    x.lastName = "Swift"
                    
                    let y = Singer(context: moc)
                    y.firstName = "Ed"
                    y.lastName = "Sheeran"
                    
                    let yy = Singer(context: moc)
                    yy.firstName = "Kate"
                    yy.lastName = "Bush"
                    
                    let z = Singer(context: moc)
                    z.firstName = "Adele"
                    z.lastName = "Adkins"
                    
                    try? moc.save()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
