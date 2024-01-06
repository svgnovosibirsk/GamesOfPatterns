//
//  FlyweightPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 06.01.2024.
//

import Foundation

protocol FlyweightPresenterDelegate: AnyObject {
    func launchShips()
}

final class FlyweightPresenter {
    
    weak var delegate: FlyweightPresenterDelegate?
    
    func launchButtonDidPress() {
        print(#function)
        delegate?.launchShips()
    }
}
