//
//  DesignSystemViewController.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import UIKit

final class DesignSystemColorViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(ColorCell.self, forCellReuseIdentifier: "ColorCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let (titleFont, titleText) = Font.nunitoExtraBold.font(size: .dsSpacing(.token200), withText: "Colors")
        title = titleText
        navigationController?.navigationBar.titleTextAttributes = [
            .font: titleFont,
            .foregroundColor: UIColor.ds(.grey1000)
        ]
        TokenManager.shared.loadStrategies(theme: .default)
        buildView()
    }
    
    func buildView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}

extension DesignSystemColorViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Static Tokens"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ColorEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath) as! ColorCell
        let color = ColorEnum.allCases[indexPath.row]
        cell.fill(dto: ColorCellViewDTO(colorName: color.rawValue, color: color.color()))
        return cell
    }
}

extension DesignSystemColorViewController: UITableViewDelegate {
    
}

