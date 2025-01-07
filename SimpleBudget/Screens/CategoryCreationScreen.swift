//
//  CategoryCreationScreen.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/25/24.
//

import SwiftUI

struct CategoryCreationScreen: View {
    @State var categoryName: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: Dimens.defaultPadding) {
                ScreenToolbar(title: "New Category")
                
                VStack(spacing: Dimens.defaultPadding) {
                    BorderedTextField(title: "Name", value: "")
                    
                    BorderedTextField(title: "Limit", value: "")
                    
                    ScrollView {
                        VStack(spacing: Dimens.defaultPadding) {
                            VStack(spacing: Dimens.smallSpacing) {
                                HeaderText(text: "Subcategories", fontSize: .largeFont)
//                                HeaderText(text: "Remaining: \(2000.00.currency)", fontSize: .mediumFont)
                            }
                            
                            BorderedTextField(title: "Name", value: "")
                            
                            BorderedTextField(title: "Limit", value: "")

                            VStack(spacing: Dimens.largeSpacing) {
                                BorderedButton(title: "Add Subcategory", action: {})
                                HeaderText(text: "Subcategories are optional.", fontSize: .smallFont)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color.background)
    }
}

#Preview {
    CategoryCreationScreen()
}
