//
//  SplitViews.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct SplitViews<PrimaryContent: View, SecondaryContent: View>: View {
    @ViewBuilder let primaryContent: () -> PrimaryContent
    @ViewBuilder let secondaryContent: () -> SecondaryContent
    
    var body: some View {
        HStack {
            primaryContent()
            
            Spacer()
            
            secondaryContent()
        }
    }
}

#Preview {
    SplitViews {
        HeaderText(text: "Primary", fontSize: 18)
    } secondaryContent: {
        HeaderText(text: "Secondary", fontSize: 18)
    }
}
