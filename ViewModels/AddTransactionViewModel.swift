//
//  AddTransactionViewModel.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 2/2/25.
//

import Foundation

class AddTransactionViewModel: ObservableObject {
    private let dataService: DataServiceProtocol
    @Published var categories: [Category] = []
    @Published var newCategories: [Category] = []
    @Published var selectedCategory: Category?
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        self.categories = dataService.loadCategories()
        self.selectedCategory = categories.first
    }
    
    func addCategory(_ category: Category) {
        newCategories.append(category)
        selectedCategory = category
    }
    
    func updateSelectedCategory(_ category: Category) {
        selectedCategory = category
    }
    
    func removeNewCategory(_ category: Category) {
        newCategories.removeAll { $0.id == category.id }
        
        if !categories.isEmpty {
            self.selectedCategory = categories.first
        } else if !newCategories.isEmpty {
            self.selectedCategory = newCategories.first
        }
    }
}
