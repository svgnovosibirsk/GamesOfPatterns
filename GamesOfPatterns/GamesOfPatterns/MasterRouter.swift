//
//  MasterRouter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 05.08.2023.
//

import Foundation

class MasterRouter {
    var masterPresenter: MasterVCPresenter!
    
    init(masterPresenter: MasterVCPresenter!) {
        self.masterPresenter = masterPresenter
    }
    
    func showViewController(name: String) {
        switch name {
        case PatternsNames.FactoryMethod.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(FactoryMethodViewController(),
                                                                               sender: self)
        case PatternsNames.AbstractFactory.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(AbstractFactoryViewController(),
                                                                               sender: self)
        default:
            print("UNKNOWN VIEW CONTROLLER NAME")
            //fatalError()
        }
    }
}