//
//  BorderedButton.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/25/24.
//

import SwiftUI

struct BorderedButton: View {
    var title: String
    var iconName = "plus"
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            if iconName.isEmpty {
                HeaderText(text: title, fontSize: .mediumFont)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background {
                        BorderedRectangle()
                    }
            } else {
                SplitHeaderIcon(title: title, fontSize: .mediumFont, icon: UIImage(systemName: iconName))
                    .padding()
                    .background {
                        BorderedRectangle()
                    }
            }
        }
    }
}

#Preview {
    BorderedButton(title: "New Category", action: {})
}
