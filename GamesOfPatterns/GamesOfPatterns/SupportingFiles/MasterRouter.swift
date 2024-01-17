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
        case PatternsNames.Bridge.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(BridgeViewController(),
                                                                               sender: self)
        case PatternsNames.Composite.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(CompositeViewController(),
                                                                               sender: self)
        case PatternsNames.Decorator.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(DecoratorViewController(),
                                                                               sender: self)
        case PatternsNames.Facade.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(FacadeViewController(),
                                                                               sender: self)
        case PatternsNames.Flyweight.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(FlyweightViewController(),
                                                                               sender: self)
        case PatternsNames.Proxy.rawValue:
            masterPresenter.view.splitViewController?.showDetailViewController(ProxyViewController(),
                                                                               sender: self)
        default:
            print("UNKNOWN VIEW CONTROLLER NAME")
            //fatalError()
        }
    }
}
