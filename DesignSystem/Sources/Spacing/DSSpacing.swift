//
//  DSSpacing.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation
import UIKit

public enum Spacing: String, CaseIterable {
    case token100
    case token200
    case token400
    case token600
    case token800
    case none
    
    func value() -> CGFloat {
        return TokenManager.shared.getSpacing(name: self).spacingValue
    }
}

public struct DSSpacing {
    public var enumValue: Spacing = .none
    public var spacingValue: CGFloat = 0
    
    init() { }
    
    init(name: String, value: String) {
        enumValue = Spacing(rawValue: name) ?? .none
        let formatter = NumberFormatter.usNumberFormatter()
        guard let number = formatter.number(from: value) else {
            spacingValue = 0
            return
        }
        spacingValue = CGFloat(truncating: number)
    }
}

public extension CGFloat {
    
    static func dsSpacing(_ spacing: Spacing) -> CGFloat {
        return spacing.value()
    }
    
}
