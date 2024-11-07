//
//  StringUtil.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import Foundation

extension String {
    static func localized(_ key: String) -> String {
        return String(localized: LocalizationValue(key))
    }
}
