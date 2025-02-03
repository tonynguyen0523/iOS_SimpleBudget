//
//  CategoryCreationScreen.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/25/24.
//

import SwiftUI

@MainActor
struct BudgetScreen: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var viewModel: AppViewModel
    @State var budget: Budget?
    let options = {
        let durations = budgetDurationList
        var options: [Int: String] = [:]
        
        durations.forEach { (duration) in
            switch duration {
            case .regular(let id, let name):
                options[id] = name
                break
            case .custom(id: let id, name: let name, length: _):
                options[id] = name
                break
            }
        }
        
        return options
    }()
    @State var selectedOption: Int = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: Dimens.defaultPadding) {
                ScreenToolbar(title: "Budget") {
                    dismiss()
                }
                
                HorizontalPicker(name: {
                    return options[self.selectedOption] ?? ""
                }, onLeftButtonTapped: {
                    if selectedOption > 0 {
                        selectedOption -= 1
                    }
                }, onRightButtonTapped: {
                    if selectedOption < options.count - 1 {
                        selectedOption += 1
                    }
                })
                
                if selectedOption == 4 {
                    BorderedTextField(title: "Days", value: "")
                }
                
//                HorizontalPicker(options: getOptions())
                
//                ScrollView {
//                    CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))
//                }
                                    
                BorderedTextField(title: "Limit", value: "")
                
                Spacer()
                
                BorderedButton(title: "Save", iconName: "checkmark") {
                    dismiss()
                }
            }
            .padding(Dimens.defaultPadding)
        }
        .background(Color.background)
        .navigationBarBackButtonHidden(true)
        .onAppear {
        }
    }
}

//#Preview {
//    BudgetScreen()
//        .environmentObject(AppViewModel())
//}
