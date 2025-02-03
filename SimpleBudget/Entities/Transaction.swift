//
//  Transaction.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 2/1/25.
//

import Foundation
import SwiftData

@Model
class Transaction {
    @Attribute(.unique) var id: UUID
    var name: String
    var amount: Double
    var date: Date
    @Relationship(deleteRule: .noAction) var category: Category?
    
    init(id: UUID = UUID(), name: String, amount: Double, date: Date, category: Category? = nil) {
        self.id = id
        self.name = name
        self.amount = amount
        self.date = date
        self.category = category
    }
}
