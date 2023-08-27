//
//  AbstractFactoryPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 26.08.2023.
//

import UIKit

final class AbstractFactoryPresenter {
    let model = TurtlesModel()
    let viewController: AbstractFactoryViewController!
    
    init(viewController: AbstractFactoryViewController!) {
        self.viewController = viewController
    }
    
    // MARK: Segmented Control
    var itemsForSegmentedControl: [String] {
        return model.turtles
    }
    
    func segmentedControlDidChange(_ segmentedControl: UISegmentedControl) {
        var color: UIColor = .green
        
        switch segmentedControl.selectedSegmentIndex {
        case 0: color = .systemBlue
        case 1: color = .systemPurple
        case 2: color = .systemRed
        case 3: color = .systemYellow
        default: color = .green
        }

        viewController.segmentedControl.selectedSegmentTintColor = color
    }
}
