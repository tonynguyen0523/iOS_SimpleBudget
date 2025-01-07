//
//  BorderedRectangle.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/25/24.
//

import SwiftUI

struct BorderedRectangle: View {
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .border(.prime, width: 2)
    }
}

#Preview {
    BorderedRectangle()
}
