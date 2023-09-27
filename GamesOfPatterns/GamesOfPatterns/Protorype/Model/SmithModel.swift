//
//  SmithModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 27.09.2023.
//

import Foundation

class Smith {
    static var count = 0
    var name = "Smith"
    var age = "Unknown"
    
    init() {
        Self.count += 1
    }
    
    // MARK: - Ptototype
    func clone() -> Smith {
        let clone = Smith()
        clone.name = name
        clone.age = age
        
        return clone
    }
}

final class SmithModel {
    let smith = Smith()
    var smithArray: [Smith] = []
    
    init() {
        smithArray.append(smith)
    }
    
    func update(clone: Smith) {
        smithArray.append(clone)
    }
}
