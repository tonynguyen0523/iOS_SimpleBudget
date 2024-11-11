//
//  HorizontalTextSelections.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/6/24.
//

import SwiftUI

struct HorizontalTextSelections: View {
    var options: [String]
    @State var selectedIndex: Int = 0
    
    var body: some View {
        HStack {
            ForEach(0 ..< options.count, id: \.self) { index in
                let option = options[index]
                
                if index == selectedIndex {
                    HeaderText(text: option, fontSize: .xxxLargeFont)
                } else {
                    Text(option)
                        .modifier(FontModifier(fontSize: .xLargeFont))
                        .foregroundStyle(.unselected)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    HorizontalTextSelections(options: ["Home", "Transactions"])
}
