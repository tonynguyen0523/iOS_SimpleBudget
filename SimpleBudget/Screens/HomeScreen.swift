//
//  HomeScreen.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/9/24.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
    @EnvironmentObject private var viewModel: AppViewModel
    
    @State private var horizontalOffset = CGFloat.zero
    @State private var addingSpending: Bool = false
    @State private var selectedCategory: OldCategory?
    @State private var launchBudget: Bool = false
    @State private var launchNewCategory: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HorizontalTextSelections(options: ["Home", "Transactions"])
                    .padding(.trailing, Dimens.defaultPadding)
                
//                if viewModel.budget != nil {
                    //                MainStatus(model: .init(
                    //                    topText: budget.length,
                    //                    mainText: budget.leftOver.currency,
                    //                    bottomLeadingText: budget.totalSpent.currency,
                    //                    bottomTrailingText: budget.limit.currency,
                    //                    filledPercentage: budget.percentageSpent
                    //                ))
                    //                .padding(.horizontal, Dimens.defaultPadding)
                    
                    ZStack(alignment: .top) {
                        ScrollView {
                            VStack(spacing: Dimens.defaultPadding) {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(height: Dimens.mediumSpacing)
                                
                                NavigationLink {
                                    AddTransactionScreen()
                                } label: {
                                    HeaderText(text: "Add New Transaction", fontSize: .mediumFont)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background {
                                            BorderedRectangle()
                                        }
                                        .padding(.horizontal, Dimens.defaultPadding)
                                }
                                
                                
    //                            if !budget.categories.isEmpty {
    //                                HeaderText(text: "Categories", fontSize: .mediumFont)
    //
    //                                ForEach(budget.categories) { category in
    //                                    CategoryStatusListItem(
    //                                        category: category,
    //                                        onSwipe: { cat in
    //                                            selectedCategory = cat
    //                                        }
    //                                    )
    //                                    .padding(.horizontal, Dimens.defaultPadding)
    //                                }
    //                            }
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
                            .frame(height: Dimens.defaultPadding * 1.25)
                    }
//                }
                
//                else {
//                    NavigationLink {
//                        BudgetScreen()
//                    } label: {
//                        HeaderText(text: "Create Budget", fontSize: .mediumFont)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background {
//                                BorderedRectangle()
//                            }
//                            .padding(.horizontal, Dimens.defaultPadding)
//                    }
//                }
//                
                Spacer()
            }
            .padding(.top, Dimens.defaultPadding)
            .ignoresSafeArea(edges: .bottom)
            .scrollIndicators(.hidden)
            .background(Color.background)
//            .fullScreenCover(item: $selectedCategory) { category in
//                AddTransactionScreen(category: category)
//            }
            //        .sheet(item: $selectedCategory) { category in
            //            AddSpendingScreen(category: category)
            //        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
