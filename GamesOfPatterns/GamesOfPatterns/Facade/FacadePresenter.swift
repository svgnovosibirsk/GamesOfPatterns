//
//  FacadePresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 02.01.2024.
//

import Foundation
protocol FacadePresenterDelegate {
    func updateReadyLabel()
}

final class FacadePresenter {
    var delegate: FacadePresenterDelegate?
    
    func startButtonDidPress() {
        print(#function)
        //delegate?.updateReadyLabel()
    }
}
