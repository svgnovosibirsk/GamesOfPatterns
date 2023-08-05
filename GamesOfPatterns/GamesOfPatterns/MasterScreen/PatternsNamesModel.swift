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

class PatternsNamesModel {
    let patterns = [["Factory method", "Abstract factory", "Builder", "Prototype", "Syngleton"],
                    ["Adapter", "Bridge", "Composite", "Decorator", "Facade", "Flyweight", "Proxy"],
                    ["Chain of responsibility", "Command", "Iterator", "Mediator", "Momento",
                     "Observer", "State", "Strategy", "Template method", "Visitor"]]
}
