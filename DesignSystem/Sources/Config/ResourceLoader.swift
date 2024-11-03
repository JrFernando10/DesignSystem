//
//  ResourceLoader.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation

class ResourceLoader {
    func readJSONFile(forName name: String) -> DesignTokenMapper {
        do {
            let bundlePath = Bundle(for: ResourceLoader.self).path(forResource: name, ofType: "json")
            guard let path = bundlePath else {
                return DesignTokenMapper(foundation: [])
            }
            
            let jsonData = try String(contentsOfFile: path).data(using: .utf8)
            guard let data = jsonData else {
                return DesignTokenMapper(foundation: [])
            }
            
            let decodedData = try JSONDecoder().decode(DesignTokenMapper.self, from: data)
            return decodedData
        } catch {
            print("Error loading JSON: \(error)")
        }
        return DesignTokenMapper(foundation: [])
    }
}
