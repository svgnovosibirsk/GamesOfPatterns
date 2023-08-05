//
//  PatternsNamesModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 05.08.2023.
//

import Foundation

enum PatternsTypes: String, CaseIterable {
    case creational = "Creational"
    case structural = "Structural"
    case behavioral = "Behavioral"
}

enum PatternsNames: String {
    // Creational
    case FactoryMethod = "Factory method"
    case AbstractFactory = "Abstract factory"
    case Builder = "Builder"
    case Prototype = "Prototype"
    case Syngleton = "Syngleton"
    
    // Structural
    case Adapter = "Adapter"
    case Bridge = "Bridge"
    case Composite = "Composite"
    case Decorator = "Decorator"
    case Facade = "Facade"
    case Flyweight = "Flyweight"
    case Proxy = "Proxy"
    
    // Behavioral
    case ChainOfResponsibility = "Chain of responsibility"
    case Command = "Command"
    case Iterator = "Iterator"
    case Mediator = "Mediator"
    case Momento = "Momento"
    case Observer = "Observer"
    case State = "State"
    case Strategy = "Strategy"
    case TemplateMethod = "Template method"
    case Visitor = "Visitor"
}

class PatternsNamesModel {
    let patterns = [[PatternsNames.FactoryMethod.rawValue,
                     PatternsNames.AbstractFactory.rawValue,
                     PatternsNames.Builder.rawValue,
                     PatternsNames.Prototype.rawValue,
                     PatternsNames.Syngleton.rawValue],
                    
                    [PatternsNames.Adapter.rawValue,
                     PatternsNames.Bridge.rawValue,
                     PatternsNames.Composite.rawValue,
                     PatternsNames.Decorator.rawValue,
                     PatternsNames.Facade.rawValue,
                     PatternsNames.Flyweight.rawValue,
                     PatternsNames.Proxy.rawValue],
                    
                    [PatternsNames.ChainOfResponsibility.rawValue,
                     PatternsNames.Command.rawValue,
                     PatternsNames.Iterator.rawValue,
                     PatternsNames.Mediator.rawValue,
                     PatternsNames.Momento.rawValue,
                     PatternsNames.Observer.rawValue,
                     PatternsNames.State.rawValue,
                     PatternsNames.Strategy.rawValue,
                     PatternsNames.TemplateMethod.rawValue,
                     PatternsNames.Visitor.rawValue]]
}
