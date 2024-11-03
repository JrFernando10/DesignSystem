//
//  DesignTokenMapper.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation

struct DesignTokenMapper: Codable {
    var foundation: [DesignToken]
}

struct DesignToken: Codable {
    var name: String
    var type: String
    var value: String
}

public class TokenManager {
    
    public enum Themes {
        case designsystem
        case `default`
    }
    
    public static let shared = TokenManager()
    
    private var colors: [String: DSColor] = [:]
    private var dynamicColors: [String: DSColor] = [:]
    private var spacing: [String: DSSpacing] = [:]
    
    private var selectedTheme = Themes.default
    
    private init() {
        loadStrategies(theme: .default)
    }
    
    public func loadStrategies(theme: Themes = .default) {
        selectedTheme = theme
        
        let tokens = loadTokens()
        tokens.forEach { color in
            colors[color.colorIdentifier] = color
        }
        
        let dynamicTokens = loadDynamicTokens()
        dynamicTokens.forEach { color in
            dynamicColors[color.colorIdentifier] = color
        }
        
        let spacingTokens = loadSpacing()
        spacingTokens.forEach { token in
            spacing[token.enumValue.rawValue] = token
        }
    }
    
    private func loadTokens() -> [DSColor] {
        let loader = ResourceLoader()
        let tokens = loader.readJSONFile(forName: "Tokens")
        return tokens.foundation.filter { $0.type == "color" }.compactMap {
            DSColor(colorHex: $0.value, value: $0.value, identifier: $0.name)
        }
    }
    
    private func loadSpacing() -> [DSSpacing] {
        let loader = ResourceLoader()
        let tokens = loader.readJSONFile(forName: "Tokens")
        return tokens.foundation.filter { $0.type == "spacing" }.compactMap {
            DSSpacing(name: $0.name, value: $0.value)
        }
    }
    
    private func loadDynamicTokens() -> [DSColor] {
        let loader = ResourceLoader()
        var file = String()
        switch selectedTheme {
        case .designsystem:
            file = "DSSDynamicTokens"
        case .default:
            file = "DSDynamicTokens"
        }
        
        let tokens = loader.readJSONFile(forName: file)
        return tokens.foundation.filter { $0.type == "color" }.compactMap {
            let colorHex = colors[$0.value]?._hexString ?? ""
            return DSColor(colorHex: colorHex, value: $0.value, identifier: $0.name)
        }
    }
    
    public func getColorFor(name: ColorEnum) -> DSColor {
        return colors[name.rawValue] ?? DSColor()
    }
    
    public func getDynamicColor(name: DynamicColorEnum) -> DSColor {
        return dynamicColors[name.rawValue] ?? DSColor()
    }
    
    func getSpacing(name: Spacing) -> DSSpacing {
        return spacing[name.rawValue] ?? DSSpacing() 
    }
}
