//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Sam Johnson on 2022-12-15.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int
    
    var body: some View {
        switch rating {
        case 1:
            return Text("🤢")
        case 2:
            return Text("🙁")
        case 3:
            return Text("😑")
        case 4:
            return Text("🙂")
        default:
            return Text("🤩")
        }
    }
}

#Preview {
    EmojiRatingView(rating: 3)
}
