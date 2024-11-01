//
//  ViewController.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import UIKit

class ViewController: UIViewController {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var colorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cores", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .ds(.downRiver1000)
        button.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var cellsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cells", for: .normal)
        button.setTitleColor(.ds(.grey1000), for: .normal)
        button.backgroundColor = .ds(.downRiver1000)
        button.addTarget(self, action: #selector(cellsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var spacingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Spacing", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .ds(.downRiver1000)
        button.addTarget(self, action: #selector(spacingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var typographyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Typography", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .ds(.downRiver1000)
        button.addTarget(self, action: #selector(typographyButtonTapped), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(colorButton)
        stackView.addArrangedSubview(cellsButton)
        stackView.addArrangedSubview(spacingButton)
        stackView.addArrangedSubview(typographyButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        // Set up constraints for stackView
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .dsSpacing(.token200)),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .dsSpacing(.token100)),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.dsSpacing(.token100)),
            
            cellsButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: .dsSpacing(.token100)),
            cellsButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -.dsSpacing(.token100)),
            colorButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: .dsSpacing(.token100)),
            colorButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -.dsSpacing(.token100)),
            spacingButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: .dsSpacing(.token100)),
            spacingButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -.dsSpacing(.token100)),
        ])
    }
    
    // Button actions
    @objc func colorButtonTapped() {
        let colorsVC = DesignSystemViewController()
        self.navigationController?.pushViewController(colorsVC, animated: true)
    }
    
    @objc func cellsButtonTapped() {
        let cellsVC = DesignSystemCellViewController()
        self.navigationController?.pushViewController(cellsVC, animated: true)
    }
    
    @objc func spacingButtonTapped() {
        let spacingVC = DesignSystemSpacingViewController()
        self.navigationController?.pushViewController(spacingVC, animated: true)
    }
    
    @objc func typographyButtonTapped() {
        let typography = DesignSystemTypographyViewController()
        self.navigationController?.pushViewController(typography, animated: true)
    }
}
