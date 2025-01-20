//
//  AddSpendingScreen.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/10/24.
//

import SwiftUI

struct AddTransactionScreen: View {
    @Environment(\.dismiss) var dismiss
    let category: Category
    @State var text: String = "$0"
    @State var amount: Double = 0.0
    @State var selectedSubcategory: Category?
    @State var isToggled: Bool = false
    @FocusState var isFocus: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: Dimens.defaultPadding) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.prime)
                            .font(Font.title2.bold())
                    }

                    Spacer()
                    
                    HeaderText(text: "New Transaction", fontSize: .largeFont)
                    
                    Spacer()
                    
                    Image(systemName: "xmark")
                        .foregroundStyle(.clear)
                        .font(Font.title2.bold())
                }
                .padding(.horizontal, Dimens.defaultPadding)
                .padding(.top, Dimens.smallSpacing)

//                MainStatus(model: .init(
//                    topText: nil,
//                    mainText: category.leftOver.currency,
//                    bottomLeadingText: category.totalSpent.currency,
//                    bottomTrailingText: category.limit.currency,
//                    filledPercentage: category.percentageSpent
//                ))
//                .padding(.horizontal, Dimens.defaultPadding)
                       
                ScrollView {
                    VStack(spacing: Dimens.largeSpacing) {
                        if let subcategories = category.subcategories {
                            
                            HeaderText(text: "Category", fontSize: .largeFont)
                            
                            BorderedButton(title: selectedSubcategory?.title ?? "Select Subcategory", iconName: "chevron.down") {
                                withAnimation(.bouncy) {
                                    isToggled.toggle()
                                }
                            }
                            .onAppear {
                                selectedSubcategory = subcategories.first
                            }
                            
                            if isToggled {
                                ForEach(subcategories) { subcategory in
                                    BorderedButton(title: subcategory.title, iconName: "chevron.down") {
                                        selectedSubcategory = subcategory
                                        withAnimation(.bouncy) {
                                            isToggled.toggle()
                                        }
                                    }
                                }
                            }
                        }
                        
                        HeaderText(text: "Transaction", fontSize: .largeFont)
                        
                        BorderedTextField(title: "Name", value: text)
                        
                        BorderedTextField(title: "Amount", value: text)
                        
                     
                        
                        Spacer()
                    }
                    .padding(.horizontal, Dimens.defaultPadding)
                }
            }
            
            BorderedButton(title: "Submit", iconName: "plus") {
                
            }
            .padding(.horizontal, Dimens.defaultPadding)
            .padding(.vertical, Dimens.defaultPadding)

        }
        .background(Color.background)
    }
}

#Preview {
    AddTransactionScreen(category: dummyCategory)
}
