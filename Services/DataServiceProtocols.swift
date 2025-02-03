//
//  DataServiceProtocols.swift
//  BudgetApp
//
//  Created by Tony Nguyen on 2/1/25.
//

import Foundation

protocol DataServiceProtocol {
    func loadCategories() -> [Category]
    func addCategory(_ category: Category)
    func deleteCategory(_ category: Category)
}
