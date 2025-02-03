//
//  BudgetDuration.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 1/21/25.
//

enum BudgetDuration {
    case regular(id: Int, name: String)
    case custom(id: Int, name: String, length: Int)
}

let budgetDurationList: [BudgetDuration] = [
    .regular(id: 0, name: "Monthly"),
    .regular(id: 1, name: "Bi-Weekly"),
    .regular(id: 2, name: "Weekly"),
    .regular(id: 3, name: "Daily"),
    .custom(id: 4, name: "Custom", length: 0),
]
