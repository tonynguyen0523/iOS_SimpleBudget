//
//  Item.swift
//  SimpleBudget
//
//  Created by Tony Nguyen on 11/4/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
