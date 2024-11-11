//
//  Category.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import Foundation

struct Category: Identifiable {
    var id: UUID = .init()
    var title: String
    var limit: Double
    var subcategories: [Category]?
    var transactions: [Transaction]?
    
    var totalSpent: Double { getTotalSpent() }
    var leftOver: Double { limit - totalSpent }
    var percentageSpent: Double {
        return totalSpent / limit
    }
    
    private func getTotalSpent() -> Double {
        let categorySpent = transactions?.reduce(0) { $0 + $1.amount } ?? 0.0
        let subcategorySpent = subcategories?.reduce(0) { $0 + $1.getTotalSpent() } ?? 0.0
        return categorySpent + subcategorySpent
    }
}
