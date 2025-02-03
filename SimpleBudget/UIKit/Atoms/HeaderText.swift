//
//  HeaderText.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

struct HeaderText: View {
    var text: String
    var fontSize: CGFloat
    var textColor: Color = .prime
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(textColor)
            .modifier(FontModifier(fontSize: fontSize))
    }
}

#Preview {
    HeaderText(text: "Hello, World!", fontSize: 20)
}
