//
//  DesignSystemCellViewController.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import UIKit

class DesignSystemCellViewController: UIViewController {
    
    private let dtos = DesignSystemCellBuilder().buildCells()
    
    private lazy var tableView: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(DSTextCell.self, forCellReuseIdentifier: "DSTextCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

extension DesignSystemCellViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dtos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DSTextCell", for: indexPath) as! DSTextCell
        
        cell.fill(with: dtos[indexPath.row])
        
        return cell
    }
}

extension DesignSystemCellViewController: UITableViewDelegate {
    
}
