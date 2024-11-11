//
//  Budget.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/9/24.
//

import Foundation

struct Budget {
    let length: String
    var limit: Double
    let categories: [Category]
    
    var totalSpent: Double {
        categories.reduce(0) { $0 + $1.totalSpent }
    }
    var leftOver: Double {
        limit - totalSpent
    }
    var percentageSpent: Double {
        totalSpent / limit
    }
}
