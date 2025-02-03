//
//  BudgetLength.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 1/21/25.
//

import Foundation
import SwiftData

@Model
class BudgetLength {
    static let monthly = 0
    static let biWeekly = 1
    static let weekly = 2
    static let daily = 3
    static let custom = 4
    
    var startDate: Date
    var length: Int
    var customLength: Int?
    
    init(startDate: Date, length: Int, customLength: Int? = nil) {
        self.startDate = startDate
        self.length = length
        self.customLength = customLength
    }
    
    static func getName(_ value: Int) -> String {
        switch value {
        case biWeekly:
            return "Bi-Weekly"
        case weekly:
            return "Weekly"
        case daily:
            return "Daily"
        case custom:
            return "Custom"
        default:
            return "Monthly"
        }
    }
}
