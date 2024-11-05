//
//  TestUtil.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import Foundation

var dummyCategory: Category {
    var c = Category(title: "Car", limit: 600.00)
//    c.transactions = [
//        Transaction(name: "Gas", amount: 30.65, categoryId: 1),
//        Transaction(name: "Gas", amount: 25.46, categoryId: 1),
//        Transaction(name: "Loan", amount: 500.00, categoryId: 1)
//    ]
    
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
