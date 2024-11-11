//
//  FilledLimitBar.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct FilledLimitBar: View {
    var filledPercentage = 0.0
    var filledColor: Color = .prime
    var showBorder: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                LimitBar()
                
                LimitBar(color: filledColor)
                    .frame(width: geometry.size.width * filledPercentage)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .border(filledColor, width: showBorder ? geometry.size.height / 4 : 0)
        }

    }
}

#Preview {
    FilledLimitBar(filledPercentage: 0.5)
}
