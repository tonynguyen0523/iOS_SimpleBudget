//
//  Budget.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/9/24.
//

import Foundation
import SwiftData

@Model
class Budget {
    var length: BudgetLength?
    var limit = 0.0
    
    init(length: BudgetLength?, limit: Double = 0.0) {
        self.length = length
        self.limit = limit
    }
    
    var totalSpent: Double {
        return 0.0
//        categories.reduce(0) { $0 + $1.totalSpent }
    }
    var leftOver: Double {
        limit - totalSpent
    }
    var percentageSpent: Double {
        totalSpent / limit
    }
}
