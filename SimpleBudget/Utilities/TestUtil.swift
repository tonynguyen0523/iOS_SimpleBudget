//
//  TestUtil.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import Foundation

var dummyCategory: Category {
    var c = Category(title: "Car", limit: 600.00)
    
    var sc1 = Category(title: "Gas", limit: 100.00)
    sc1.transactions = [
        Transaction(name: "Gas", amount: 30.65, categoryId: 1),
        Transaction(name: "Gas", amount: 25.46, categoryId: 1),
    ]
    
    
    var sc2 = Category(title: "Loan", limit: 500.00)
    sc2.transactions = [
        Transaction(name: "Loan", amount: 250.00, categoryId: 1),
        Transaction(name: "Loan", amount: 150.00, categoryId: 1)
    ]
    
    c.subcategories = [sc1, sc2]

    return c
}

var dummyCategory2: Category {
    var c = Category(title: "Savings", limit: 2000.00)
    c.transactions = [
        Transaction(name: "Add to savings", amount: 500.00, categoryId: 2),
        Transaction(name: "Add to savings", amount: 500.00, categoryId: 2),
    ]

    return c
}

var dummyCategory3: Category {
    var c = Category(title: "Utilities", limit: 300.00)
    
    var sc1 = Category(title: "Internet", limit: 80.00)
    sc1.transactions = [
        Transaction(name: "Paid Internet", amount: 80.00, categoryId: 3)
    ]
    
    
    let sc2 = Category(title: "Water", limit: 56.00)
    let sc3 = Category(title: "Electricity", limit: 82.68)
    
    c.subcategories = [sc1, sc2, sc3]

    return c
}

var dummyCategory4: Category {
    let c = Category(title: "Apartment", limit: 2400.00)
    return c
}

var dummyCategories: [Category] {
    return [
        dummyCategory,
        dummyCategory2,
        dummyCategory3,
        dummyCategory4
    ]
}
