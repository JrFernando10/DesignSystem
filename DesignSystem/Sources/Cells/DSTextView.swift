//
//  DSTextView.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation
import UIKit

public class DSTextView: UIView {
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    public func render(with dto: DSTextCellDTO) {
        setupView()
        icon.image = dto.icon
        title.text = dto.title
    }
    
    private func setupView() {
        addSubview(icon)
        addSubview(title)
        buildView()
    }
    
    private func buildView() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            icon.widthAnchor.constraint(equalToConstant: 48),
            icon.heightAnchor.constraint(equalToConstant: 48),
            
            title.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    
}

public struct DSTextCellDTO {
    let icon: UIImage
    let title: String
}
