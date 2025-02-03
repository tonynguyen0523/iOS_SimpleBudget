//
//  AppViewModel.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 1/21/25.
//

import Foundation

class AppViewModel: ObservableObject {
    @Published var categories: [Category] = []
    
    private let dataService: DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func addCategory(_ category: Category) {
        dataService.addCategory(category)
        categories.append(category)
    }
    
    func deleteCategory(category: Category) {
        dataService.deleteCategory(category)
        loadCategories()
    }
    
    func loadCategories() {
        categories = dataService.loadCategories()
    }
}
