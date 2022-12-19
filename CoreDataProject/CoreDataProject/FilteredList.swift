//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Sam Johnson on 2022-12-16.
//

import CoreData
import SwiftUI

enum MyPredicate: String, CaseIterable, Identifiable {
    case beginsWith = "BEGINSWITH"
    case endsWith = "ENDSWITH"
    case contains = "CONTAINS"
    
    var id: String {
        self.rawValue
    }
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(
        filterKey: String,
        filterPredicate: MyPredicate,
        filterValue: String,
        sortDescriptors: [SortDescriptor<T>],
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        _fetchRequest = FetchRequest<T>(
            sortDescriptors: sortDescriptors,
            predicate: NSPredicate(format: "%K \(filterPredicate)[c] %@", filterKey, filterValue)
        )
        self.content = content
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
