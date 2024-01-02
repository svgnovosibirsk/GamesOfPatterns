//
//  FacadeModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 02.01.2024.
//

import Foundation

//TODO: Make all methods sync and async. Simulate long execution sleep(2)
final class FacadeModel {
    // MARK: - Facade
    func startStarOfDeath() -> String {
        var readySign = ""
        
        let starNuclearFuelSystem = StarNuclearFuelSystem()
        let starEngine =  StarEngine()
        let starWeapons = StarWeapons()
        let starNavigation = StarNavigation()
        let starOxigenSystem = StarOxigenSystem()
        let starElectricSystem = StarElectricSystem()
        
        let fuel = starNuclearFuelSystem.getNuclearFuel()
        starEngine.startEngine(with: fuel)
        starElectricSystem.startElectricSystem(with: fuel)
        starOxigenSystem.checkOxigenSystem()
        starOxigenSystem.startOxigenSystem()
        starWeapons.prepareWeapon()
        starNavigation.calculateTransition()
        
        
        print("Star of Death is Ready")
        
        readySign = "READY"
        
        return readySign
    }
}

final class StarEngine {
    func startEngine(with fuel: NuclearFuel) {
        print("Power is \(fuel.energy)")
        print("Engine is ready")
        print("Engine is started")
    }
}

struct NuclearFuel {
    let energy: Int
}

final class StarNuclearFuelSystem {
    func getNuclearFuel() -> NuclearFuel {
        return NuclearFuel(energy: 1_000_000_000_000)
    }
}

final class StarWeapons {
    func prepareWeapon() {
        print("Weapon is ready")
    }
}

final class StarNavigation {
    func calculateTransition() {
        print("Route is calculated")
    }
}

final class StarOxigenSystem {
    func checkOxigenSystem() {
        print("OxigenSystem did check")
    }
    
    func startOxigenSystem() {
        print("OxigenSystem did start")
    }
}

final class StarElectricSystem {
    func startElectricSystem (with fuel: NuclearFuel) {
        print("Power is \(fuel.energy)")
        print("ElectricSystem is ready")
        print("ElectricSystem is started")
    }
}


