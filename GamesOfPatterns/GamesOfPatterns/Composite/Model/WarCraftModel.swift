//
//  WarCraftModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 30.12.2023.
//

import Foundation

protocol IWarCraftModel {
    func getOrcsArmyCount() -> Int
    func getHumansArmyCount() -> Int
}

final class WarCraftModel: IWarCraftModel {
    
    
    func getOrcsArmyCount() -> Int {
        let army = createOrcsArmy()
        //MARK: - Composite
        return army.getCount()
    }
    
    func getHumansArmyCount() -> Int {
        let army = createHumansArmy()
        //MARK: - Composite
        return army.getCount()
    }
    
    private func createOrcsArmy() -> OrksArmy {
        var army = OrksArmy()
        
        for _ in 1...100 {
            let ork = Ork()
            army.addWarrior(ork)
        }
        
        return army
    }
    
    private func createHumansArmy() -> HumansArmy {
        var army = HumansArmy()
        
        for _ in 1...250 {
            let human = Human()
            army.addWarrior(human)
        }
        
        return army
    }
}
