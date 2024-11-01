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
    
    public static var shared = TokenManager()
    
    private var colors: [String: DSColor] = [:]
    private var dynamicColors: [String: DSColor] = [:]
    private var spacing: [String: DSSpacing] = [:]
    
    private var selectedTheme = Themes.default
    
    public func loadStrategies(theme: Themes = .default) {
        selectedTheme = theme
        let tokens = loadTokens()
        tokens.forEach { color in
            colors.addDictionary(dictionaryToAppend: [color.colorIdentifier: color])
        }
        let dynamicTokens = loadDynamicTokens()
        dynamicTokens.forEach { color in
            dynamicColors.addDictionary(dictionaryToAppend: [color.colorIdentifier: color])
        }
        
        let spacingTokens = loadSpacing()
        spacingTokens.forEach { token in
            spacing.addDictionary(dictionaryToAppend: [token.enumValue.rawValue: token])
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
            DSColor(colorHex: colors[$0.value]?._hexString ?? "", value: $0.value, identifier: $0.name)
        }
    }
    
    public func getColorFor(name: ColorEnum) -> DSColor {
        guard let color = colors[name.rawValue] else {
            return DSColor()
        }
        return color
    }
    
    public func getDynamicColor(name: DynamicColorEnum) -> DSColor {
        guard let color = dynamicColors[name.rawValue] else {
            return DSColor()
        }
        return color
    }
    
    func getSpacing(name: Spacing) -> DSSpacing {
        guard let spacing = spacing[name.rawValue] else {
            return DSSpacing()
        }
        return spacing
    }
}
