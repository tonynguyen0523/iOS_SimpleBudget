//
//  CategorySpendingInfo.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct CategoryStatusModel {
    var topLeadingText: String
    var topTrailingText: String
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
            SplitHeaderTexts(
                leadingText: model.topLeadingText,
                trailingText: model.topTrailingText,
                fontSize: topHeaderFontSize
            )
            
            StatusBar(
                filledPercentage: model.filledPercentage,
                bottomLeadingText: "Spent: \(model.bottomLeadingText)",
                bottomTrailingText: "Limit: \(model.bottomTrailingText)",
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
            topTrailingText: category.limit.currency,
            bottomLeadingText: category.totalSpent.currency,
            bottomTrailingText: category.limit.currency,
            filledPercentage: category.percentageSpent
        ),
        topHeaderFontSize: .largeFont,
        bottomHeaderFontSize: .mediumFont
    )
}
