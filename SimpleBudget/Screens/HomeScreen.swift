//
//  HomeScreen.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/9/24.
//

import SwiftUI

struct HomeScreen: View {
    var budget: Budget
    @State private var horizontalOffset = CGFloat.zero
    @State private var addingSpending: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HorizontalTextSelections(options: ["Home", "Transactions"])
                .padding(.bottom, Dimens.defaultPadding)
                .padding(.horizontal, Dimens.defaultPadding)
            
            MainStatus(model: .init(
                topText: budget.length,
                mainText: budget.leftOver.currency,
                bottomLeadingText: budget.totalSpent.currency,
                bottomTrailingText: budget.limit.currency,
                filledPercentage: budget.percentageSpent
            ))
            .padding(.horizontal, Dimens.defaultPadding)
            
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: Dimens.defaultPadding) {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: Dimens.mediumSpacing)
                        
                        ForEach(budget.categories) { category in
                            CategoryStatusListItem(
                                category: category,
                                onSwipe: { cat in
                                    addingSpending.toggle()
                                }
                            )
                            .padding(.horizontal, Dimens.defaultPadding)
                        }
                    }
                    .padding(.bottom, Dimens.defaultPadding)
                }
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.background, Color.clear]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(height: Dimens.defaultPadding)
            }
        }
        .padding(.top, Dimens.defaultPadding)
        .ignoresSafeArea(edges: .bottom)
        .scrollIndicators(.hidden)
        .background(Color.background)
        .sheet(isPresented: $addingSpending) {
            AddSpendingScreen()
        }
    }
}

#Preview {
    HomeScreen(budget: .init(
        length: "Biweekly",
        limit: 6000.00,
        categories: dummyCategories)
    )
}