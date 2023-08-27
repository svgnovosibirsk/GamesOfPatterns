//
//  AbstractFactoryViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 05.08.2023.
//

import UIKit

final class AbstractFactoryViewController: UIViewController {
    
    let presenter = AbstractFactoryPresenter()
    
    let nameLabel = UILabel()
    
    var segmentedControl: UISegmentedControl! = nil
   
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Abstract Factory"
        view.backgroundColor = .systemBackground
        
        setupSegmentedControl()
    }
    
    private func setupSegmentedControl() {
        segmentedControl = UISegmentedControl(items: presenter.itemsForSegmentedControl)
        segmentedControl.backgroundColor = .systemGreen
        segmentedControl.selectedSegmentTintColor = .green
        
        setupNameLabel()
        setSegmentedControlConstraints()
        
    }
    
    private func setSegmentedControlConstraints() {
        segmentedControl?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    private func setupNameLabel() {
        nameLabel.text = "TMNT"
        nameLabel.textAlignment = .center
        nameLabel.textColor = .systemGreen
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        setNameLabelConstraints()
    }
    
    private func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
        ])
    }

}
