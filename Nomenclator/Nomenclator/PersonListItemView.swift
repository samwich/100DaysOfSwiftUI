//
//  PersonListItemView.swift
//  Nomenclator
//
//  Created by Sam Johnson on 2023-02-25.
//

import SwiftUI

struct PersonListItemView: View {
    @State var person: Person
    
    var body: some View {
        NavigationLink {
            // This should be another View
            Image(uiImage: UIImage(contentsOfFile: person.imageURL().path)!)
                .resizable()
                .scaledToFit()
                .padding()
            Text(person.name)
                .font(.largeTitle)
            if let location = person.location {
                MapView(location: location)
            } else {
                Text("No location available.")
            }

        } label: {
            HStack {
                Image(uiImage: UIImage(contentsOfFile: person.imageURL().path)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text(person.name)
            }
        }
    }
}

//struct PersonListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonListItemView()
//    }
//}
