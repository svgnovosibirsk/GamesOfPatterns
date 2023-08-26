//
//  AbstractFactoryPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 26.08.2023.
//

import Foundation

final class AbstractFactoryPresenter {
    let model = TurtlesModel()
    
    var itemsForSegmentedControl: [String] {
        return model.turtles
    }
}
