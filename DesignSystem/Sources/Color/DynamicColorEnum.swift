//
//  DynamicColorEnum.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation
import UIKit

public enum DynamicColorEnum: String, CaseIterable, Codable {
    
    case interactiveMain = "interactive-main"
    case conversionDefault = "conversion-default"
    case backgroundMain = "background-main"
    
    public func color() -> UIColor {
        return TokenManager.shared.getDynamicColor(name: DynamicColorEnum(rawValue: self.rawValue) ?? .interactiveMain).color
    }
    
}
