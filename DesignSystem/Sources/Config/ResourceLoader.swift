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
          if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
          let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
              
              do {
                  let data = try JSONDecoder().decode(DesignTokenMapper.self, from: jsonData)
                  return data
              } catch let exc {
                  print(exc)
              }
          }
       } catch {
          print(error)
       }
        return DesignTokenMapper(foundation: [])
    }
}
