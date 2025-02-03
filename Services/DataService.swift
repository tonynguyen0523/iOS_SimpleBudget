//
//  DataService.swift
//  BudgetApp
//
//  Created by Tony Nguyen on 2/1/25.
//

import Foundation
import SwiftData

class DataService {
    private let modelContainer: ModelContainer?
    private let modelContext: ModelContext?
    private let schema = Schema([
        Category.self,
        Transaction.self
    ])
    
    @MainActor
    static let shared = DataService()
    
    @MainActor
    private init() {
        do {
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
            self.modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            self.modelContext = self.modelContainer?.mainContext
        } catch {
            self.modelContainer = nil
            self.modelContext = nil
        }
    }
}

extension DataService: DataServiceProtocol {
    func loadCategories() -> [Category] {
        do {
            return try modelContext?.fetch(FetchDescriptor<Category>()) ?? []
        } catch {
            // TODO: Handle Error
            return []
        }
    }
    
    func addCategory(_ category: Category) {
        do {
            modelContext?.insert(category)
            try modelContext?.save()
        } catch {
            // TODO: Handle Error
        }
    }
    
    func deleteCategory(_ category: Category) {
        do {
            modelContext?.delete(category)
            try modelContext?.save()
        } catch {
            // TODO: Handle Error
        }
    }
}
