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
    
    var factory: TurtleFactory?
    
    init(viewController: AbstractFactoryViewController!) {
        self.viewController = viewController
    }
    
    // MARK: Segmented Control
    var itemsForSegmentedControl: [String] {
        return model.turtles
    }
    
    func segmentedControlDidChange(_ segmentedControl: UISegmentedControl) {
        // MARK: Abstract Factory
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            factory = LeonardoFactory()
        case 1:
            factory = DonatelloFactory()
        case 2:
            factory = RaphaelFactory()
        case 3:
            factory = MichelangeloFactory()
        default:
            //fatalError("Unknown switch case")
            print("Unknown case")
        }

        setupScreen()
    }
    
    private func setupScreen() {
        // MARK: Abstract Factory
        viewController.segmentedControl.selectedSegmentTintColor = factory?.createColor()
        
        viewController.nameLabel.textColor = factory?.createColor()
        viewController.nameLabel.text = factory?.createName()
        
        viewController.turtleImageView.layer.borderColor = factory?.createColor().cgColor
        viewController.turtleImageView.image = factory?.createImage()
    }
}
