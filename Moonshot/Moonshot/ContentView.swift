//
//  ContentView.swift
//  Moonshot
//
//  Created by Sam Johnson on 2022-11-26.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAsGrid = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            Group {
                ScrollView {
                    if showingAsGrid {
                        MissionGridView(missions: missions, astronauts: astronauts)
                    } else {
                        MissionListView(missions: missions, astronauts: astronauts)
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        withAnimation {
                            showingAsGrid.toggle()
                        }
                    } label: {
                        Image(systemName: showingAsGrid ? "list.star" : "square.grid.3x3")
                    }
                }
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
