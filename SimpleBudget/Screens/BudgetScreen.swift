//
//  CategoryCreationScreen.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/25/24.
//

import SwiftUI

struct BudgetScreen: View {
    @State var categoryName: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: Dimens.defaultPadding) {
                ScreenToolbar(title: "Budget")
                
                HStack(spacing: 0) {
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.prime)
                            .frame(width: 50, height: 50)
                    }

                    HeaderText(text: "Biweekly", fontSize: .mediumFont)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background {
                            BorderedRectangle()
                        }
                                        
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.forward")
                            .foregroundStyle(.prime)
                            .frame(width: 50, height: 50)
                    }
                }
                .background {
                    BorderedRectangle()
                }
                                    
                BorderedTextField(title: "Limit", value: "")
                
                Spacer()
                
                BorderedButton(title: "Save") {
                    
                }
            }
            .padding(Dimens.defaultPadding)
        }
        .background(Color.background)
    }
}

#Preview {
    BudgetScreen()
}
