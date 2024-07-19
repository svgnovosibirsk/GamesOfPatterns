//
//  Comand.swift
//  GamesOfPatterns
//
//  Created by Sergey on 19.07.2024.
//

import UIKit

protocol Comand {
    func execute()
}

final class RouteComand: Comand {
    var label: UILabel
    
    init(label: UILabel) {
        self.label = label
    }
    
    func execute() {
        label.text = "Route is calculated."
    }
}

final class WarpComand: Comand {
    var label: UILabel
    
    init(label: UILabel) {
        self.label = label
    }
    
    func execute() {
        label.text! = "Warp is ready."
    }
}
