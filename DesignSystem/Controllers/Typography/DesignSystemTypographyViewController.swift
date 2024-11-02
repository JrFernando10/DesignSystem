//
//  DesignSystemTypographyViewController.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import Foundation
import UIKit

class DesignSystemTypographyViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        view.backgroundColor = .white
        let (titleFont, titleText) = Font.nunitoExtraBold.font(size: .dsSpacing(.token200), withText: "Fontes do Design System")
        title = titleText
        navigationController?.navigationBar.titleTextAttributes = [
            .font: titleFont,
            .foregroundColor: UIColor.ds(.grey1000)
        ]
        setup()
    }
    
    func setup() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)

        Font.allCases.forEach { font in
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = font.font(size: 16)
            label.text = font.rawValue
            label.textAlignment = .left
            stackView.addArrangedSubview(label)
        }

        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .dsSpacing(.token200)),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .dsSpacing(.token100)),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.dsSpacing(.token100)),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.dsSpacing(.token200))
        ])
    }
}
