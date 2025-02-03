//
//  TextFieldButton.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 2/1/25.
//

import SwiftUI

struct TextFieldButton: View {
    var title: String = ""
    var buttonTitle: String = ""
    var action: ((String) -> Void)? = nil
    @State var isEditing = false
    
    var body: some View {
        if isEditing {
            BorderedTextFieldButton(title: title, buttonTitle: buttonTitle, value: "", action: action)
        } else {
            BorderedButton(title: title) {
                withAnimation(.smooth) {
                    isEditing.toggle()
                }
            }
        }
    }
}

#Preview {
    TextFieldButton(title: "Add New Category", buttonTitle: "Add")
}
