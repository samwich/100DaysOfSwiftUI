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
    @State private var lastNameFilter = "A"

    
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let x = Singer(context: moc)
                x.firstName = "Taylor"
                x.lastName = "Swift"

                let y = Singer(context: moc)
                y.firstName = "Ed"
                y.lastName = "Sheeran"

                let z = Singer(context: moc)
                z.firstName = "Adele"
                z.lastName = "Adkins"

                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
