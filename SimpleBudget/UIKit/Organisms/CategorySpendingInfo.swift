//
//  CategorySpendingInfo.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct CategorySpendingInfo: View {
    var category: Category
    var topHeaderFontSize: CGFloat
    var bottomHeaderFontSize: CGFloat
    var limitBarHeight = Dimens.mediumLimitBarHeight
    
    var body: some View {
        VStack(spacing: Dimens.mediumSpacing) {
            SplitHeaderTexts(
                leadingText: category.title,
                trailingText: category.limit.currency,
                fontSize: topHeaderFontSize
            )
            
            FilledLimitBar(filledPercentage: category.percentageSpent)
                .frame(height: limitBarHeight)
            
            SplitHeaderTexts(
                leadingText: "Spent: \(category.totalSpent.currency)",
                trailingText: "Limit: \(category.limit.currency)",
                fontSize: bottomHeaderFontSize
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
    
    return CategorySpendingInfo(
        category: category,
        topHeaderFontSize: 18.0,
        bottomHeaderFontSize: 16.0
    )
}
