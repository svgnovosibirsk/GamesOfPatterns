//
//  FlyweightPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 06.01.2024.
//

import Foundation

protocol FlyweightPresenterDelegate: AnyObject {
    func launchShips(count: Int)
}

final class FlyweightPresenter {
    
    weak var delegate: FlyweightPresenterDelegate?
    let shipFactory = SpaceShipFactory()
    
    func launchButtonDidPress() {
        let count = Int.random(in: 1...6)
        delegate?.launchShips(count: count)
    }
}
