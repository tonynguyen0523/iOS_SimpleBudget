//
//  BorderedTextField.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/25/24.
//

import SwiftUI

struct BorderedTextField: View {
    var title: String
    @State var value: String
    
    var body: some View {
        HStack(spacing: 0) {
            HeaderText(text: title, fontSize: .mediumFont)
                .frame(width: 60)
                .padding(.horizontal, Dimens.defaultPadding)
            
            TextField(title, text: $value)
                .multilineTextAlignment(.center)
                .foregroundStyle(.prime)
                .modifier(FontModifier(fontSize: .mediumFont))
                .padding()
                .background {
                    BorderedRectangle()
                }
        }
        .background {
            BorderedRectangle()
        }
    }
}

#Preview {
    BorderedTextField(title: "Name", value: "")
}
