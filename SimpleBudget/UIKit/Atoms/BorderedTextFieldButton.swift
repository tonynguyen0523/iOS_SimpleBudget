//
//  BorderedTextFieldButton.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 1/8/25.
//

import SwiftUI

struct BorderedTextFieldButton: View {
    var title: String
    var buttonTitle = "Submit"
    @State var value: String
    var action: ((String) -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 0) {
            TextField(title, text: $value)
                .multilineTextAlignment(.center)
                .foregroundStyle(.prime)
                .modifier(FontModifier(fontSize: .mediumFont))
                .padding()
                .background {
                    BorderedRectangle()
                }
            
            Button {
                self.action?(self.value)
            } label: {
                HeaderText(text: buttonTitle, fontSize: .mediumFont)
                    .padding(.horizontal, Dimens.defaultPadding)
            }
        }
        .background {
            BorderedRectangle()
        }
    }
}

#Preview {
    BorderedTextFieldButton(title: "Name", value: "")
}
