//
//  AddSpendingScreen.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/10/24.
//

import SwiftUI

struct AddTransactionScreen: View {
    @ObservedObject private var viewModel: AddTransactionViewModel
    @Environment(\.dismiss) var dismiss
    @State var text: String = "$0"
    @State var amount: Double = 0.0
    @State var selectedSubcategory: OldCategory?
    @State var isToggled: Bool = false
    @FocusState var isFocus: Bool
    
    init(dataService: DataServiceProtocol = DataService.shared) {
        self.viewModel = AddTransactionViewModel(dataService: dataService)
    }
    
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
                        HeaderText(text: "Category", fontSize: .largeFont)

                        if let selectedCategory = viewModel.selectedCategory {
                            BorderedButton(title: selectedCategory.name, iconName: isToggled ? "chevron.up" : "chevron.down") {
                                toggleCategorySelection()
                            }
                        } else {
                            TextFieldButton(title: "Add New Category", buttonTitle: "Add") { value in
                                self.viewModel.addCategory(.init(name: value))
                                toggleCategorySelection()
                            }
                        }
               
                        if isToggled {
                            TextFieldButton(title: "Add New Category", buttonTitle: "Add") { value in
                                self.viewModel.addCategory(.init(name: value))
                                toggleCategorySelection()
                            }
                            
                            ForEach(viewModel.categories) { category in
                                if category.id != viewModel.selectedCategory?.id {
                                    BorderedButton(title: category.name, iconName: "") {
                                        viewModel.updateSelectedCategory(category)
                                        toggleCategorySelection()
                                    }
                                }
                            }
                            
                            ForEach(viewModel.newCategories) { category in
                                HStack {
                                    HeaderText(text: category.name, fontSize: .mediumFont)
                                        .onTapGesture {
                                            viewModel.updateSelectedCategory(category)
                                            toggleCategorySelection()
                                        }
                                    
                                    Spacer() // TODO: Make the text fill up the spacer area
                                    
                                    Button {
                                        viewModel.removeNewCategory(category)
                                        toggleCategorySelection()
                                    } label: {
                                        HeaderText(text: "Delete", fontSize: .xSmallFont, textColor: .red)
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background {
                                    BorderedRectangle()
                                }
                            }
                        }
                        
                        HeaderText(text: "Transaction", fontSize: .largeFont)
                        
                        BorderedTextField(title: "Name", value: text)
                        
                        BorderedTextField(title: "Amount", value: text)
                        
                        BorderedTextField(title: "Date", value: getCurrentDateString())
                        
                        Spacer()
                    }
                    .padding(.horizontal, Dimens.defaultPadding)
                }
            }
            
            ZStack {
                BorderedButton(title: "Submit", iconName: "plus") {
                    
                }
                .padding(.horizontal, Dimens.defaultPadding)
                .padding(.vertical, Dimens.defaultPadding)
            }
            .background {
                Color.background.opacity(0.9)
                    .ignoresSafeArea()
                    .blur(radius: 20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.background)
    }
    
    func toggleCategorySelection() {
        withAnimation(.bouncy) {
            self.isToggled.toggle()
        }
    }
}

#Preview {
    AddTransactionScreen(dataService: DummyDataService())
}
