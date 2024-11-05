//
//  SplitHeaderIcon.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct SplitHeaderIcon: View {
    var title: String
    var fontSize: CGFloat
    var icon: UIImage?
    
    var body: some View {
        SplitViews {
            HeaderText(text: title, fontSize: fontSize)
        } secondaryContent: {
            if let icon {
                Image(uiImage: icon)
                    .foregroundStyle(.prime)
            } else {
                Image(systemName: "star")
                    .foregroundStyle(.prime)
            }
        }
    }
}

#Preview {
    SplitHeaderIcon(title: "Card", fontSize: 18.0, icon: UIImage(systemName: "creditcard")!)
}
