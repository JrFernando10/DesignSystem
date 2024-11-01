//
//  DSTextCell.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation
import UIKit

public protocol DSCellDelegate: AnyObject {
    func didTap()
}

public final class DSTextCell: UITableViewCell {
    
    private var view: DSTextView = DSTextView()
    
    public weak var delegate: DSCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
        
    private func setup() {
        view.pinToBounds(of: contentView)
        contentView.backgroundColor = .clear
        contentView.clipsToBounds = false
        selectionStyle = .none
    }
    
    public func fill(with dto: DSTextCellDTO) {
        view.render(with: dto)
    }
    
    func didTap() {
        print("tapped cell")
    }
    
}
