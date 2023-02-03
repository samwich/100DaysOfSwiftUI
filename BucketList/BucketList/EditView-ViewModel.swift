//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Sam Johnson on 2023-02-02.
//

import Foundation

extension EditView {
    @MainActor class ViewModel: ObservableObject {
        var location: Location

        @Published var name: String
        @Published var description: String
        
        @Published private(set) var loadingState = LoadingState.loading
        @Published private(set) var pages = [Page]()

        var newLocation: Location {
            var locationCopy = location
            locationCopy.id = UUID()
            locationCopy.name = name
            locationCopy.description = description
            return locationCopy
        }
        
        init(location: Location) {
            self.location = location
            name = location.name
            description = location.description
        }
        
        func fetchNearbyPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Result.self, from: data)
                pages = items.query.pages.values.sorted()
                loadingState = .loaded
            } catch {
                loadingState = .failed
            }
        }
    }
}
