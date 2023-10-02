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
        case PatternsNames.Builder.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(BuilderViewController(),
                                                                               sender: self)
        case PatternsNames.Prototype.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(PrototypeViewController(),
                                                                               sender: self)
        case PatternsNames.Singleton.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(SingletonViewController(),
                                                                               sender: self)
        case PatternsNames.Adapter.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(AdapterViewController(),
                                                                               sender: self)
        default:
            print("UNKNOWN VIEW CONTROLLER NAME")
            //fatalError()
        }
    }
}
