//
//  HumansModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 30.12.2023.
//

import Foundation

//MARK: - Composite
final class Human: Composite {
    func getCount() -> Int {
        return 1
    }
}

final class HumansArmy: Composite {
    private var warriors = [Human]()
   
    func getCount() -> Int {
        var count = 0
        for warrior in warriors {
            count += warrior.getCount()
        }
        return count
    }
    
    func addWarrior(_ human: Human) {
        warriors.append(human)
    }
}
