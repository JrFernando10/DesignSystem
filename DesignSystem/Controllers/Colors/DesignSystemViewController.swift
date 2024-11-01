//
//  DesignSystemViewController.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import UIKit

class DesignSystemViewController: UIViewController {
    
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["C1", "C2"])
        control.selectedSegmentIndex = 0
        return control
    }()
    
    
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
        TokenManager.shared.loadStrategies(theme: .default)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        buildView()
    }
    
    @objc func segmentedControlValueChanged() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            TokenManager.shared.loadStrategies(theme: .default)
        case 1:
            TokenManager.shared.loadStrategies(theme: .designsystem)
        default:
            break
        }
        tableView.reloadData()
    }
    
    
    func buildView() {
        navigationItem.titleView = segmentedControl
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
}

extension DesignSystemViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Dynamic Tokens" : "Static Tokens"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return DynamicColorEnum.allCases.count
        }
        return ColorEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath) as! ColorCell
        
        if indexPath.section == 0 {
            let color = DynamicColorEnum.allCases[indexPath.row]
            cell.fill(dto: ColorCellViewDTO(colorName: color.rawValue, color: color.color()))
            return cell
        }
        
        let color = ColorEnum.allCases[indexPath.row]
        cell.fill(dto: ColorCellViewDTO(colorName: color.rawValue, color: color.color()))
        
        return cell
    }
}

extension DesignSystemViewController: UITableViewDelegate {
    
}

