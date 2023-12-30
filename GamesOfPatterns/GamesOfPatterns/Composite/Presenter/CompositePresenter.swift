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
    
    var delegate: CompositePresenterDelegate?
    
    func orcButtonPressed() {
        print(#function)
    }
    
    func humanButtonPressed() {
        print(#function)
    }
    
}
