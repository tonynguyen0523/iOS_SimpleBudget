//
//  HorizontalPicker.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 1/21/25.
//

import SwiftUI

struct HorizontalPicker: View {
//    var options: [Int : String] = [:]
//    @State var optionSelected: Int = 0
//    var selectedIndex: Int = 0
    var name: () -> String
    var onLeftButtonTapped: (() -> Void)
    var onRightButtonTapped: (() -> Void)
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                onLeftButtonTapped()
            } label: {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(.prime)
                    .frame(width: 50)
            }
            
            HeaderText(text: name(), fontSize: .mediumFont)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background {
                    BorderedRectangle()
                }
            
            Button {
                onRightButtonTapped()
            } label: {
                Image(systemName: "chevron.forward")
                    .foregroundStyle(.prime)
                    .frame(width: 50)
            }
        }
        .background {
            BorderedRectangle()
        }
    }
    
//    private func updateOptionSelected(isIncremented: Bool) {
//        if isIncremented {
//            if optionSelected + 1 > options.count - 1 {
//                optionSelected = 0
//            } else {
//                optionSelected += 1
//            }
//        } else {
//            if optionSelected - 1 < 0 {
//                optionSelected = options.count - 1
//            } else {
//                optionSelected -= 1
//            }
//        }
//    }
}

protocol HorizontalPickerDelegate {
    func getSelectedName() -> String
    func onLeftButtonTapped()
    func onRightButtonTapped()
}

#Preview {
    HorizontalPicker(name: {
        return "Hello"
    }, onLeftButtonTapped: {
        
    }, onRightButtonTapped: {
        
    })
}
