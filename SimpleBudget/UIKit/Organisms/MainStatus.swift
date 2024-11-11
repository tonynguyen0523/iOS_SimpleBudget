//
//  MainStatus.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/9/24.
//

import SwiftUI

struct MainStatusModel {
    var topText: String
    var mainText: String
    var bottomLeadingText: String
    var bottomTrailingText: String
    var filledPercentage: Double
}

struct MainStatus: View {
    var model: MainStatusModel
    
    var body: some View {
        VStack(spacing: Dimens.mediumSpacing) {
            HeaderText(text: model.topText, fontSize: .smallFont)
            
            HeaderText(text: model.mainText, fontSize: .largeHeaderFont)
            
            StatusBar(
                filledPercentage: model.filledPercentage,
                bottomLeadingText: "Spent: \(model.bottomLeadingText)",
                bottomTrailingText: "Limit: \(model.bottomTrailingText)",
                bottomHeaderFontSize: .mediumFont,
                limitBarHeight: Dimens.largeLimitBarHeight,
                showBorder: true
            )
        }
    }
}

#Preview {
    MainStatus(model: .init(
        topText: "Biweekly",
        mainText: 3000.00.currency,
        bottomLeadingText: 1000.00.currency,
        bottomTrailingText: 4000.00.currency,
        filledPercentage: 0.3)
    )
}
