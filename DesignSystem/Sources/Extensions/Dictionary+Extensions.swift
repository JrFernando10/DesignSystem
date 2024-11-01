//
//  Dictionary+Extensions.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation

public extension Dictionary where Key == String {
 
    @discardableResult mutating func addDictionary(dictionaryToAppend: Dictionary) -> Dictionary {
        if dictionaryToAppend.keys.isEmpty {
            return self
        }

        for (k, v) in dictionaryToAppend {
            self.updateValue(v, forKey: k)
        }
        return self
    }
}
