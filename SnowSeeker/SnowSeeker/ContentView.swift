//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Sam Johnson on 2023-11-16.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

enum SortResortsBy {
    case none, name, country
}

struct ContentView: View {
    @State private var searchText = ""
    @State private var sortResortsBy = SortResortsBy.none
    @StateObject var favorites = Favorites()
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                HStack {
                    NavigationLink {
                        ResortView(resort: resort)
                    } label: {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItemGroup {
                    Picker("Sort", selection: $sortResortsBy) {
                        Text("None").tag(SortResortsBy.none)
                        Text("Name").tag(SortResortsBy.name)
                        Text("Country").tag(SortResortsBy.country)
                    }
                }
            }
            
            WelcomeView()
        }
        .environmentObject(favorites)
    }
    
    var sortedResorts: [Resort] {
        switch sortResortsBy {
        case .none:
            return resorts
        case .name:
            return resorts.sorted {
                $0.name < $1.name
            }
        case .country:
            return resorts.sorted {
                $0.country < $1.country
            }
        }
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return sortedResorts
        } else {
            return sortedResorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#Preview {
    ContentView()
}
