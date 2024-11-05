//
//  CurrencyUtil.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 10/27/24.
//

import Foundation

extension Double {
    var currency: String {
        NumberFormatter().currencySymbol + String(format: "%.2f", self)
    }
}
