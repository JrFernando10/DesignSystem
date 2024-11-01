//
//  ColorCell.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation
import UIKit


class ColorCell: UITableViewCell {
    
    private let view: ColorCellView = ColorCellView()
    
    func setup() {
        view.pinToBounds(of: self.contentView)
        backgroundColor = .clear
        layoutSubviews()
    }
    
    public func fill(dto: ColorCellViewDTO) {
        setup()
        view.fill(dto: dto)
    }
}

struct ColorCellViewDTO {
    var colorName: String
    var color: UIColor
}

class ColorCellView: UIView {
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "XPTO"
        label.textColor = .black
        return label
    }()
    
    private lazy var sampleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    func setup() {
        addSubview(title)
        addSubview(sampleView)
        
        NSLayoutConstraint.activate([
            sampleView.topAnchor.constraint(equalTo: topAnchor),
            sampleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sampleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            sampleView.widthAnchor.constraint(equalToConstant: .dsSpacing(.token600)),
            
            title.topAnchor.constraint(equalTo: topAnchor, constant: .dsSpacing(.token100)),
            title.leadingAnchor.constraint(equalTo: sampleView.trailingAnchor, constant: .dsSpacing(.token200)),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.dsSpacing(.token100))
        ])
        
        sampleView.layer.cornerRadius = 4
        sampleView.layer.borderColor = UIColor.black.cgColor
        sampleView.layer.borderWidth = 1
        
        title.textColor = .black
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func fill(dto: ColorCellViewDTO) {
        setup()
        sampleView.backgroundColor = dto.color
        
        title.text = dto.colorName
    }
}
