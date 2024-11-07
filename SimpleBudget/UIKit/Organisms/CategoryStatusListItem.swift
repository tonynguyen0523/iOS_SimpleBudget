//
//  CategorySpendingItem.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct CategoryStatusListItem: View {
    let category: Category
    @State var expanded: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: Dimens.defaultPadding) {
                
                CategoryStatus(
                    model: CategoryStatusModel(
                        topLeadingText: category.title,
                        topTrailingText: category.limit.currency,
                        bottomLeadingText: "Spent: \(category.totalSpent.currency)",
                        bottomTrailingText: "Limit: \(category.limit.currency)",
                        filledPercentage: category.percentageSpent
                    ),
                    topHeaderFontSize: .largeFont,
                    bottomHeaderFontSize: .mediumFont
                )
                
                if let sc = category.subcategories {
                    HStack {
                        Rectangle()
                            .fill(.prime)
                            .frame(height: 1)
                        
                        HeaderText(text: "<<< \(String.localized("SwipeToAdd"))", fontSize: .xSmallFont)
                    }
                    
                    SplitHeaderIcon(
                        title: .localized("Subcategories"),
                        fontSize: .largeFont,
                        icon: UIImage(systemName: expanded ? "chevron.down.square" : "chevron.right.square")
                    )
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            expanded.toggle()
                        }
                    }
                    
                    if expanded {
                        VStack(spacing: Dimens.defaultPadding) {
                            ForEach(sc) { subcategory in
                                CategoryStatus(
                                    model: CategoryStatusModel(
                                        topLeadingText: subcategory.title,
                                        topTrailingText: subcategory.limit.currency,
                                        bottomLeadingText: "Spent: \(subcategory.totalSpent.currency)",
                                        bottomTrailingText: "Limit: \(subcategory.limit.currency)",
                                        filledPercentage: subcategory.percentageSpent
                                    ),
                                    topHeaderFontSize: .mediumFont,
                                    bottomHeaderFontSize: .smallFont,
                                    limitBarHeight: Dimens.smallLimitBarHeight
                                )
                            }
                        }
                    }
                }
            }
            .padding(Dimens.defaultPadding)
        }
        .background(
            Rectangle()
                .fill(Color.white)
                .border(.prime, width: 2)
        )
    }
}

#Preview {
    CategoryStatusListItem(category: dummyCategory)
}
