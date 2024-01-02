//
//  FacadePresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 02.01.2024.
//

import Foundation
protocol FacadePresenterDelegate {
    func updateReadyLabel(with message: String)
}

final class FacadePresenter {
    var delegate: FacadePresenterDelegate?
    let model = FacadeModel()
    
    func startButtonDidPress() {
        print(#function)
        let message = model.startStarOfDeath()
        delegate?.updateReadyLabel(with: message)
    }
}
