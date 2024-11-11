//
//  AddSpendingScreen.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/10/24.
//

import SwiftUI

struct AddSpendingScreen: View {
    @State var text: String = ""
    @State var amount: Double = 0.0
    @FocusState var isFocus: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 40) {
                MainStatus(model: .init(
                    topText: "Car",
                    mainText: 200.00.currency,
                    bottomLeadingText: 300.00.currency,
                    bottomTrailingText: 500.00.currency,
                    filledPercentage: 0.5
                ))
                
                TextField(0.00.currency, text: $text)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.prime)
                    .modifier(FontModifier(fontSize: 50))
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
                        isFocus = true
                    }
                
                Button {
                    //
                } label: {
                    HeaderText(text: "Submit", fontSize: .largeHeaderFont)
                }

                
                Spacer()
            }
            .padding(Dimens.defaultPadding)
        }
        .background(Color.background)
    }
}

#Preview {
    AddSpendingScreen()
}
