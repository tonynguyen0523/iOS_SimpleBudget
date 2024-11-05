//
//  LimitBar.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct LimitBar: View {
    var color: Color = .background
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(color)
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    LimitBar()
}
