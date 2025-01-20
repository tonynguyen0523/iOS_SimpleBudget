//
//  CategorySpendingItem.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct CategoryStatusListItem: View {
    let category: Category
    let onSwipe: (Category) -> Void
    @State var expanded: Bool = false
    @State private var horizontalOffset = CGFloat.zero
    
    var body: some View {
        ZStack {
            VStack(spacing: Dimens.defaultPadding) {
                CategoryStatus(
                    model: CategoryStatusModel(
                        topLeadingText: category.title,
                        topTrailingText: category.totalSpent.currency,
                        bottomLeadingText: "",
                        bottomTrailingText: category.totalSpent.currency,
                        filledPercentage: category.percentageSpent
                    ),
                    topHeaderFontSize: .largeFont,
                    bottomHeaderFontSize: .smallFont
                )
                
                if let sc = category.subcategories {
                    HStack {
                        Rectangle()
                            .fill(.prime)
                            .frame(height: 1)
                        
                        HeaderText(text: "<<< \(String.localized("SwipeToAdd"))", fontSize: .xSmallFont)
                    }
                    
                    SplitHeaderIcon(
                        title: .localized("Recent Transactions"),
                        fontSize: .mediumFont,
                        icon: UIImage(systemName: expanded ? "chevron.up" : "chevron.down")
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
                                        topTrailingText: subcategory.leftOver.currency,
                                        bottomLeadingText: subcategory.totalSpent.currency,
                                        bottomTrailingText: subcategory.limit.currency,
                                        filledPercentage: subcategory.percentageSpent
                                    ),
                                    topHeaderFontSize: .mediumFont,
                                    bottomHeaderFontSize: .smallFont,
                                    limitBarHeight: Dimens.smallLimitBarHeight
                                )
                            }
                        }
                    }
                } else {
                    HStack {
                        Spacer()
                        
                        HeaderText(text: "<<< \(String.localized("SwipeToAdd"))", fontSize: .xSmallFont)
                    }
                }
            }
            .padding(Dimens.defaultPadding)
        }
        .background(
            BorderedRectangle()
        )
        .offset(x: horizontalOffset)
        .simultaneousGesture(DragGesture()
            .onChanged { value in
                if abs(value.translation.width) > abs(value.translation.height) {
                    if value.translation.width < 0 {
                        horizontalOffset = value.translation.width
                        
                        if horizontalOffset < -100 {
                            onSwipe(category)
                            horizontalOffset = .zero
                        }
                    }
                }
    
            }
            .onEnded { _ in
                horizontalOffset = .zero
            }
        )
        .animation(.spring, value: horizontalOffset)
    }
}

#Preview {
    CategoryStatusListItem(category: dummyCategory, onSwipe: { _ in })
}
