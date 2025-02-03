//
//  TestUtil.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import Foundation

var dummyBudget: Budget {
    var b = Budget(length: BudgetLength(startDate: .now, length: BudgetLength.biWeekly), limit: 3000.00)
    return b
}

var dummyTransactions: [OldTransaction] {
    var t = [
        OldTransaction(name: "Gas", amount: 30.65, categoryId: 1),
        OldTransaction(name: "Gas", amount: 25.46, categoryId: 1),
        OldTransaction(name: "Loan", amount: 250.00, categoryId: 1),
        OldTransaction(name: "Loan", amount: 150.00, categoryId: 1),
        OldTransaction(name: "Add to savings", amount: 500.00, categoryId: 2),
        OldTransaction(name: "Paid Internet", amount: 80.00, categoryId: 3)
    ]

    return []
}

var dummyCategory: OldCategory {
    var c = OldCategory(title: "Car", limit: 600.00)
    
    var sc1 = OldCategory(title: "Gas", limit: 100.00)
    sc1.transactions = [
        OldTransaction(name: "Gas", amount: 30.65, categoryId: 1),
        OldTransaction(name: "Gas", amount: 25.46, categoryId: 1),
    ]
    
    
    var sc2 = OldCategory(title: "Loan", limit: 500.00)
    sc2.transactions = [
        OldTransaction(name: "Loan", amount: 250.00, categoryId: 1),
        OldTransaction(name: "Loan", amount: 150.00, categoryId: 1)
    ]
    
    c.subcategories = [sc1, sc2]

    return c
}

var dummyCategory2: OldCategory {
    var c = OldCategory(title: "Savings", limit: 2000.00)
    c.transactions = [
        OldTransaction(name: "Add to savings", amount: 500.00, categoryId: 2),
        OldTransaction(name: "Add to savings", amount: 500.00, categoryId: 2),
    ]

    return c
}

var dummyCategory3: OldCategory {
    var c = OldCategory(title: "Utilities", limit: 300.00)
    
    var sc1 = OldCategory(title: "Internet", limit: 80.00)
    sc1.transactions = [
        OldTransaction(name: "Paid Internet", amount: 80.00, categoryId: 3)
    ]
    
    
    let sc2 = OldCategory(title: "Water", limit: 56.00)
    let sc3 = OldCategory(title: "Electricity", limit: 82.68)
    
    c.subcategories = [sc1, sc2, sc3]

    return c
}

var dummyCategory4: OldCategory {
    let c = OldCategory(title: "Apartment", limit: 2400.00)
    return c
}

var dummyCategories: [OldCategory] {
    return [
        dummyCategory,
        dummyCategory2,
        dummyCategory3,
        dummyCategory4
    ]
}

class DummyDataService: DataServiceProtocol {
    func loadCategories() -> [Category] {
        return [
            .init(name: "Car"),
            .init(name: "Food"),
            .init(name: "Amazon"),
            .init(name: "Savings"),
            .init(name: "Utilities"),
            .init(name: "Apartment"),
            .init(name: "Other")
        ]
    }
    
    func addCategory(_ category: Category) {
        //
    }
    
    func deleteCategory(_ category: Category) {
        //
    }
}
