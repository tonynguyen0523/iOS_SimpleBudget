//
//  ContentView.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        HomeScreen(budget: .init(
            length: "Biweekly",
            limit: 6000.00,
            categories: dummyCategories)
        )
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
