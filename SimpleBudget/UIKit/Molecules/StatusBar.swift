//
//  StatusBar.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/9/24.
//

import SwiftUI

struct StatusBar: View {
    var filledPercentage: Double = 0.5
    var bottomLeadingText: String = ""
    var bottomTrailingText: String = ""
    var bottomHeaderFontSize: CGFloat = .mediumFont
    var limitBarHeight = Dimens.mediumLimitBarHeight
    var showBorder: Bool = false

    var body: some View {
        FilledLimitBar(filledPercentage: filledPercentage, showBorder: showBorder)
            .frame(height: limitBarHeight)
        
        SplitHeaderTexts(
            leadingText: bottomLeadingText,
            trailingText: bottomTrailingText,
            fontSize: bottomHeaderFontSize
        )
    }
}

#Preview {
    StatusBar()
}
