//
//  Dimens.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import Foundation

struct Dimens {
    // MARK: Padding
    static let defaultPadding: CGFloat = 20.0
    
    // MARK: Spacing
    static let defaultSpacing: CGFloat = defaultPadding
    static let largeSpacing: CGFloat = defaultSpacing / 2.0
    static let mediumSpacing: CGFloat = largeSpacing * 0.8
    static let smallSpacing: CGFloat = largeSpacing * 0.6
    
    
    // MARK: Limit Bar
    static let largeLimitBarHeight = 10.0
    static let mediumLimitBarHeight = largeLimitBarHeight * 0.8
    static let smallLimitBarHeight = largeLimitBarHeight * 0.6
}
