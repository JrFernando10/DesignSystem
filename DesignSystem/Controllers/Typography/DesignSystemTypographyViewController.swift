//
//  DesignSystemTypographyViewController.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation
import UIKit

class DesignSystemTypographyViewController: UIViewController {
    
    // Declare UI elements
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = .dsSpacing(.token200)
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ds(.backgroundMain)
        setup()
    }
    
    func setup() {
        view.addSubview(stackView)
        
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Nunito-Bold", size: 16)
        label.text = "Lorem ipsum dolor"
        stackView.addArrangedSubview(label)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // Set up constraints for stackView
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .dsSpacing(.token200)),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .dsSpacing(.token100)),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.dsSpacing(.token100)),
        ])
    }
}
