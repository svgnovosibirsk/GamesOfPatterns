//
//  OrcsModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 30.12.2023.
//

import Foundation

//MARK: - Composite
final class Ork: Composite {
    func getCount() -> Int {
        return 1
    }
}

final class OrksArmy: Composite {
    private var warriors = [Ork]()
   
    func getCount() -> Int {
        var count = 0
        for warrior in warriors {
            count += warrior.getCount()
        }
        return count
    }
    
    func addWarrior(_ ork: Ork) {
        warriors.append(ork)
    }
}
