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
    var presenter: MasterVCPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Design Patterns"
        
        view.backgroundColor = .systemBackground
        
        presenter = MasterVCPresenter(view: self)
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        
        setupTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellsIds.cellId.rawValue)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemGray,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
