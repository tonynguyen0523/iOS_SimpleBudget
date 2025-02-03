//
//  ContentView.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var viewModel: AppViewModel
    
    init() {
        viewModel = .init(dataService: .shared)
    }
    
    var body: some View {
        HomeScreen()
            .environmentObject(viewModel)
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}

extension ContentView {

}
