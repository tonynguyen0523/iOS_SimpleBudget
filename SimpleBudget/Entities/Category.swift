//
//  Category.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 2/1/25.
//

import Foundation
import SwiftData

@Model
class Category {
    @Attribute(.unique) var id: UUID
    var name: String
    @Relationship(deleteRule: .nullify) var transactions: [Transaction] = []
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
