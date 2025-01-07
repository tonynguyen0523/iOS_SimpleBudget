//
//  BorderedButton.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/25/24.
//

import SwiftUI

struct BorderedButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            //
        } label: {
            SplitHeaderIcon(title: title, fontSize: .mediumFont, icon: UIImage(systemName: "plus"))
                .padding()
                .background {
                    BorderedRectangle()
                }
        }
    }
}

#Preview {
    BorderedButton(title: "New Category", action: {})
}