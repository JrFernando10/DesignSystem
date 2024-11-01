//
//  UIView+Extensions.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation
import UIKit

extension UIView {
    func pinToBounds(of view: UIView, customSpacing: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: customSpacing.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: customSpacing.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: customSpacing.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: customSpacing.bottom)
        ])
    }
}
