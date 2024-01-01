//
//  DecoratorPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 01.01.2024.
//

import Foundation

protocol DecoratorPresenterDelegate {
    func updateSpeedLabel(with speed: String)
}

final class DecoratorPresenter {
    var delegate: DecoratorPresenterDelegate?
    var model: RacingCarModel?
    
    init() {
        self.model = RacingCarModel()
    }
    
    func gasButtonDidPress() {
        model?.addRacingGas()
    }
    
    func engineButtonDidPress() {
        model?.addRacingEngine()
    }
    
    func nitroButtonDidPress() {
        model?.addRacingNitro()
    }
    
    func speedButtonDidPress() {
        let speed = model?.getMaxSpeed()
        delegate?.updateSpeedLabel(with: "\(speed ?? 0)")
    }
    
}
