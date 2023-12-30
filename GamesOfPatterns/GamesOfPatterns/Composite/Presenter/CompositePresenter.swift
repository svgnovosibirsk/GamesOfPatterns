//
//  CompositePresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 30.12.2023.
//

import Foundation
protocol CompositePresenterDelegate {
    func updateNumberLabel(with number: String)
}

final class CompositePresenter {
    
    let model = WarCraftModel()
    var delegate: CompositePresenterDelegate?
    
    func orcButtonPressed() {
        let armyCount = model.getOrcsArmyCount()
        delegate?.updateNumberLabel(with: "\(armyCount)")
    }
    
    func humanButtonPressed() {
        let armyCount = model.getHumansArmyCount()
        delegate?.updateNumberLabel(with: "\(armyCount)")
    }
    
}
