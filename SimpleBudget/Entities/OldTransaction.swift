//
//  Transaction.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import Foundation

struct OldTransaction {
    var name: String
    var amount: Double
    var categoryId: Int
    var categoryName: String = "Others"
    var date: Date?
}
