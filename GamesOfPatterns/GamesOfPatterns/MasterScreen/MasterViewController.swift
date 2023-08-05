//
//  ViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 29.07.2023.
//

import UIKit

enum CellsIds: String {
    case cellId = "patternCell"
}

class MasterViewController: UIViewController {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    let presenter = MasterVCPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Design Patterns"
        
        view.backgroundColor = .white
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        
        setupTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellsIds.cellId.rawValue)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
    }
}
