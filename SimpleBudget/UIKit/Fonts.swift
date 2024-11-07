//
//  Fonts.swift
//  Simple Budget
//
//  Created by Tony Nguyen on 11/3/24.
//

import Foundation
import SwiftUI

public struct FontModifier: ViewModifier {
    var fontSize: CGFloat
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize))
            .fontDesign(.monospaced)
    }
}

extension CGFloat {
    static var xxxLargeFont: CGFloat {
        return 24.0
    }
    
    static var xxLargeFont: CGFloat {
        return 22.0
    }
    
    static var xLargeFont: CGFloat {
        return 20.0
    }
    
    static var largeFont: CGFloat {
        return 18.0
    }
    
    static var mediumFont: CGFloat {
        return 16.0
    }
    
    static var smallFont: CGFloat {
        return 14.0
    }
    
    static var xSmallFont: CGFloat {
        return 12.0
    }
}
