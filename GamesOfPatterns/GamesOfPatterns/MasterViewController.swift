//
//  ViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 29.07.2023.
//

import UIKit

class MasterViewController: UIViewController {
    let patterns = ["First", "Second", "Third"]
    let cellId = "patternCell"
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
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

extension MasterViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1 // TEST
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        patterns.count // TEST
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = patterns[indexPath.row]
        //cell.imageView?.image = UIImage(systemName: "star.fill") // TEST
        
        return cell
    }
}

extension MasterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("Cell at \(indexPath) is selected") // TEST
        
    // TODO: make switching to detail VC via Router
//        splitViewController?.showDetailViewController(MasterViewController(), sender: self) // TEST
    }
}


