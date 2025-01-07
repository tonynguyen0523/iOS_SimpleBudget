//
//  HorizontalTextSelections.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/6/24.
//

import SwiftUI

struct HorizontalTextSelections: View {
    var options: [String]
    var selectedFontSize: CGFloat = .xxxLargeFont
    var unselectedFontSize: CGFloat = .xLargeFont
    var onSelect: ((Int) -> Void)?
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< options.count, id: \.self) { index in
                    let option = options[index]
                    
                    if index == selectedIndex {
                        HeaderText(text: option, fontSize: selectedFontSize)
                    } else {
                        Text(option)
                            .modifier(FontModifier(fontSize: unselectedFontSize))
                            .foregroundStyle(.unselected)
                            .onTapGesture {
                                selectedIndex = index
                                onSelect?(index)
                            }
                    }
                }
                
                Spacer()
            }
            .padding(.leading, Dimens.defaultPadding)
        }
    }
}

#Preview {
    HorizontalTextSelections(options: ["Home", "Transactions"]) { index in
        
    }
}
