//
//  DesignSystemCellBuilder.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation
import UIKit

final class DesignSystemCellBuilder {
    
    func buildCells() -> [DSTextCellDTO] {
        
        let icons: [UIImage] = [UIImage.add, UIImage.remove, UIImage.checkmark]
        let titles: [String] = ["Title 1", "Title 2", "Title 3"]

        var dsTextCellDTOArray: [DSTextCellDTO] = []

        for i in 0..<min(icons.count, titles.count) {
            let dsTextCellDTO = DSTextCellDTO(icon: icons[i], title: titles[i])
            dsTextCellDTOArray.append(dsTextCellDTO)
        }

        return dsTextCellDTOArray
    }
    
}
