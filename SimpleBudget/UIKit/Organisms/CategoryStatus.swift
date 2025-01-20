//
//  CategorySpendingInfo.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct CategoryStatusModel {
    var topLeadingText: String
    var topTrailingText: String?
    var bottomLeadingText: String
    var bottomTrailingText: String
    var filledPercentage: Double
}

struct CategoryStatus: View {
    var model: CategoryStatusModel
    var topHeaderFontSize: CGFloat
    var bottomHeaderFontSize: CGFloat
    var limitBarHeight = Dimens.mediumLimitBarHeight
    
    var body: some View {
        VStack(spacing: Dimens.mediumSpacing) {
            if let topTrailingText = model.topTrailingText {
                SplitHeaderTexts(
                    leadingText: model.topLeadingText,
                    trailingText: topTrailingText,
                    fontSize: topHeaderFontSize
                )
            } else {
                HeaderText(text: model.topLeadingText, fontSize: topHeaderFontSize)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            StatusBar(
                filledPercentage: model.filledPercentage,
                bottomLeadingText: "",
                bottomTrailingText: "",
                bottomHeaderFontSize: bottomHeaderFontSize,
                limitBarHeight: limitBarHeight
            )
        }
    }
}

#Preview {
    var category = Category(title: "Car", limit: 600.00)
    category.transactions = [
        Transaction(name: "Gas", amount: 30.65, categoryId: 1),
        Transaction(name: "Gas", amount: 25.46, categoryId: 1),
        Transaction(name: "Loan", amount: 500.00, categoryId: 1)
    ]
    
    return CategoryStatus(
        model: CategoryStatusModel(
            topLeadingText: category.title,
            topTrailingText: nil,
            bottomLeadingText: category.totalSpent.currency,
            bottomTrailingText: category.limit.currency,
            filledPercentage: category.percentageSpent
        ),
        topHeaderFontSize: .largeFont,
        bottomHeaderFontSize: .mediumFont
    )
}
