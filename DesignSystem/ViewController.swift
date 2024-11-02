//
//  ViewController.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var buttons: [UIButton] = {
        let titles = ["Colors", "Spacing", "Typography", "Cells"]
        return titles.map { title in
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(.ds(.grey900), for: .normal)
            button.backgroundColor = .ds(.interactiveMain)
            button.contentHorizontalAlignment = .left
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            return button
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ds(.grey10)
        title = "DesignSystem"
        setup()
    }
    
    func setup() {
        view.addSubview(stackView)
        buttons.forEach { button in
            stackView.addArrangedSubview(button)
            addSeparator()
        }
        setupConstraints()
    }
    
    private func addSeparator() {
        let separator = UIView()
        separator.backgroundColor = .ds(.grey200)
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(separator)
        
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        separator.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .dsSpacing(.token200)),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .dsSpacing(.token100)),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.dsSpacing(.token100)),
        ])
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        switch sender.title(for: .normal) {
        case "Colors":
            let colorsVC = DesignSystemColorViewController()
            self.navigationController?.pushViewController(colorsVC, animated: true)
        case "Cells":
            let cellsVC = DesignSystemCellViewController()
            self.navigationController?.pushViewController(cellsVC, animated: true)
        case "Spacing":
            let spacingVC = DesignSystemSpacingViewController()
            self.navigationController?.pushViewController(spacingVC, animated: true)
        case "Typography":
            let typographyVC = DesignSystemTypographyViewController()
            self.navigationController?.pushViewController(typographyVC, animated: true)
        default:
            break
        }
    }
}
