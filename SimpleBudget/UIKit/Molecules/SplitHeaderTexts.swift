//
//  SplitHeaderTexts.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct SplitHeaderTexts: View {
    var leadingText: String
    var trailingText: String
    var fontSize: CGFloat
    
    var body: some View {
        SplitViews {
            HeaderText(text: leadingText, fontSize: fontSize)
        } secondaryContent: {
            HeaderText(text: trailingText, fontSize: fontSize)
        }
    }
}

#Preview {
    SplitHeaderTexts(
        leadingText: "Spent",
        trailingText: "Limit",
        fontSize: 16.0
    )
}
