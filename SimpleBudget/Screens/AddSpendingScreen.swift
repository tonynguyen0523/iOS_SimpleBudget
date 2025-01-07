//
//  AddSpendingScreen.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/10/24.
//

import SwiftUI

struct AddSpendingScreen: View {
    @Environment(\.dismiss) var dismiss
    let category: Category
    @State var text: String = "$0"
    @State var amount: Double = 0.0
    @State var selectedSubcategory: Category?
    @FocusState var isFocus: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
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
                    
                    HeaderText(text: category.title, fontSize: .largeFont)
                    
                    Spacer()
                    
                    Image(systemName: "xmark")
                        .foregroundStyle(.clear)
                        .font(Font.title2.bold())
                }
                .padding(.horizontal, Dimens.defaultPadding)

                MainStatus(model: .init(
                    topText: nil,
                    mainText: category.leftOver.currency,
                    bottomLeadingText: category.totalSpent.currency,
                    bottomTrailingText: category.limit.currency,
                    filledPercentage: category.percentageSpent
                ))
                .padding(.horizontal, Dimens.defaultPadding)
                
                if let subcategories = category.subcategories {
                    VStack(spacing: Dimens.smallSpacing) {
                        HeaderText(text: "Subcategory", fontSize: .largeFont)
                        
                        HorizontalTextSelections(
                            options: subcategories.map { $0.title },
                            selectedFontSize: .xLargeFont,
                            unselectedFontSize: .mediumFont) { index in
                                selectedSubcategory = subcategories[index]
                            }
                        
                        StatusBar(
                            filledPercentage: selectedSubcategory?.percentageSpent ?? 0.0,
                            bottomLeadingText: "Spent: \(selectedSubcategory?.totalSpent.currency ?? "$0.00")",
                            bottomTrailingText: "Limit: \(selectedSubcategory?.limit.currency ?? "$0.00")",
                            bottomHeaderFontSize: .mediumFont,
                            limitBarHeight: Dimens.mediumLimitBarHeight,
                            showBorder: true
                        )
                        .padding(.horizontal, Dimens.defaultPadding)
                    }
                    .onAppear {
                        selectedSubcategory = subcategories.first
                    }
                }
                
                TextField(0.00.currency, text: $text)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.prime)
                    .modifier(FontModifier(fontSize: .largeHeaderFont))
                    .focused($isFocus)
                    .keyboardType(.decimalPad)
//                    .onChange(of: text) { newValue in
//                        print(newValue)
//                        if let convertedValue = Double(newValue) {
//                            text = convertedValue.currency
//                        } else {
//                            text = 0.0.currency // Handle invalid input
//                        }
//                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isFocus = true
                        }
                    }
                
                Button {
                    //
                } label: {
                    HeaderText(text: "Submit", fontSize: .xxxLargeFont)
                }

                
                Spacer()
            }
        }
        .background(Color.background)
    }
}

#Preview {
    AddSpendingScreen(category: dummyCategory)
}
