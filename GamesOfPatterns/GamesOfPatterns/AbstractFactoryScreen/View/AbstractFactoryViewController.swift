//
//  AbstractFactoryViewController.swift
//  GamesOfPatterns
//
//  Created by Sergey on 05.08.2023.
//

import UIKit

final class AbstractFactoryViewController: UIViewController {
    
    let presenter = AbstractFactoryPresenter()
    
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

}
