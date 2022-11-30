//
//  RectangleDividerView.swift
//  Moonshot
//
//  Created by Sam Johnson on 2022-11-30.
//

import SwiftUI

struct RectangleDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct RectangleDividerView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleDividerView()
    }
}
