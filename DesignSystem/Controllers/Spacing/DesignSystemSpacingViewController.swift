//
//  DesignSystemSpacingViewController.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import UIKit

class DesignSystemSpacingViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = .dsSpacing(.token200)
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        view.addSubview(stackView)
        Spacing.allCases.filter { $0 != .none }.forEach { token in
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: .dsSpacing(token)).isActive = true
            view.widthAnchor.constraint(equalToConstant: .dsSpacing(token)).isActive = true
            view.backgroundColor = .ds(.downRiver50)
            
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "\(token.rawValue) = \(token.value())"
            label.textAlignment = .center
            
            stackView.addArrangedSubview(view)
            stackView.addArrangedSubview(label)
        }
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .dsSpacing(.token200)),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .dsSpacing(.token100)),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.dsSpacing(.token100)),
        ])
    }
}
