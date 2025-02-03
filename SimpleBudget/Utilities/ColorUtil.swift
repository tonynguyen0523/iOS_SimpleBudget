//
//  ColorUtil.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import SwiftUI

import Foundation

func getCurrentDate() -> Date {
    return Date()
}

func getCurrentDateString() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    return dateFormatter.string(from: getCurrentDate())
}
