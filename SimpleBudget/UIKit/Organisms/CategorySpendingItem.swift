//
//  CategorySpendingItem.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct CategorySpendingItem: View {
    let category: Category
    @State var expanded: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: Dimens.defaultPadding) {
                CategorySpendingInfo(
                    category: category,
                    topHeaderFontSize: .largeFont,
                    bottomHeaderFontSize: .mediumFont
                )
                
                if let sc = category.subcategories {
                    HStack {
                        Rectangle()
                            .fill(.prime)
                            .frame(height: 1)
                        
                        HeaderText(text: "<<< Swipe to add", fontSize: .xSmallFont)
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
                                CategorySpendingInfo(
                                    category: subcategory,
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
    CategorySpendingItem(category: dummyCategory)
}
