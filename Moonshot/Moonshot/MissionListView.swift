//
//  MissionListView.swift
//  Moonshot
//
//  Created by Sam Johnson on 2022-11-30.
//

import SwiftUI

struct MissionListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        LazyVStack {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(decorative: mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
//                            .padding()
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
//                        .padding(.vertical)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                    .padding(.trailing)
                }
            }
        }
//        .padding([.horizontal, .bottom])
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionListView(missions: missions, astronauts: astronauts)
        .preferredColorScheme(.dark)
}
