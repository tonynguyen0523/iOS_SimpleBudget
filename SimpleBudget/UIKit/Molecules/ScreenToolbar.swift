//
//  ScreenToolbar.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/25/24.
//

import SwiftUI

struct ScreenToolbar: View {
    var title: String
    
    var body: some View {
        HStack {
            Button {
//                dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(.prime)
                    .font(Font.title2.bold())
            }

            Spacer()
            
            HeaderText(text: title, fontSize: .largeFont)
            
            Spacer()
            
            Image(systemName: "xmark")
                .foregroundStyle(.clear)
                .font(Font.title2.bold())
        }
    }
}

#Preview {
    ScreenToolbar(title: "New Category")
}
