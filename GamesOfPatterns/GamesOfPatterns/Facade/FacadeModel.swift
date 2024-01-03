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
//    func startStarOfDeath() -> String {
//        var readySign = ""
//
//        let starNuclearFuelSystem = StarNuclearFuelSystem()
//        let starEngine =  StarEngine()
//        let starWeapons = StarWeapons()
//        let starNavigation = StarNavigation()
//        let starOxigenSystem = StarOxigenSystem()
//        let starElectricSystem = StarElectricSystem()
//
//        let fuel = starNuclearFuelSystem.getNuclearFuel()
//        starEngine.startEngine(with: fuel)
//        starElectricSystem.startElectricSystem(with: fuel)
//        starOxigenSystem.checkOxigenSystem()
//        starOxigenSystem.startOxigenSystem()
//        starWeapons.prepareWeapon()
//        starNavigation.calculateTransition()
//
//
//        print("Star of Death is Ready")
//
//        readySign = "READY"
//
//        return readySign
//    }
}

extension FacadeModel {
    //MARK: - Async version Operation
    func startStarOfDeath(completion: @escaping (String) -> Void) {
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
        completion(readySign)
    }
}

/*
extension FacadeModel {
    //MARK: - Async version GCD concurrent queue
    func startStarOfDeath(completion: @escaping (String) -> Void) {
        var readySign = ""
        
        let starNuclearFuelSystem = StarNuclearFuelSystem()
        let starEngine =  StarEngine()
        let starWeapons = StarWeapons()
        let starNavigation = StarNavigation()
        let starOxigenSystem = StarOxigenSystem()
        let starElectricSystem = StarElectricSystem()
        
        let startGroup = DispatchGroup()
        let startQueue = DispatchQueue(label: "com.star-start.queue", qos: .utility, attributes: .concurrent)
        
        var fuel = NuclearFuel(energy: 0)
        
        startQueue.sync {
            startGroup.enter()
            startQueue.sync {
                fuel = starNuclearFuelSystem.getNuclearFuel()
                startGroup.leave()
            }
            
            startGroup.enter()
            startQueue.async {
                starEngine.startEngine(with: fuel)
                startGroup.leave()
            }
            
            startGroup.enter()
            startQueue.async {
                starElectricSystem.startElectricSystem(with: fuel)
                startGroup.leave()
            }
            
            startGroup.enter()
            startQueue.async {
                starOxigenSystem.checkOxigenSystem()
                startGroup.leave()
                
                startGroup.enter()
                startQueue.sync {
                    starOxigenSystem.startOxigenSystem()
                    startGroup.leave()
                }
            }
            
            startGroup.enter()
            startQueue.async {
                starWeapons.prepareWeapon()
                startGroup.leave()
            }
            
            startGroup.enter()
            startQueue.async {
                starNavigation.calculateTransition()
                startGroup.leave()
            }
        }
        
        startGroup.notify(queue: startQueue) {
            DispatchQueue.main.async {
                print("Star of Death is Ready")
            }
            readySign = "READY"
            completion(readySign)
        }
    }
}
*/

/*
extension FacadeModel {
    //MARK: - Async version GCD serial queue
    func startStarOfDeath(completion: @escaping (String) -> Void) {
        var readySign = ""
        
        let starNuclearFuelSystem = StarNuclearFuelSystem()
        let starEngine =  StarEngine()
        let starWeapons = StarWeapons()
        let starNavigation = StarNavigation()
        let starOxigenSystem = StarOxigenSystem()
        let starElectricSystem = StarElectricSystem()
        
        let startGroup = DispatchGroup()
        let startQueue = DispatchQueue(label: "com.star-start.queue", qos: .utility)
        
        var fuel = NuclearFuel(energy: 0)
        
        
        startQueue.async {
            startGroup.enter()
            fuel = starNuclearFuelSystem.getNuclearFuel()
            startGroup.leave()
        }
        
        //TODO: bind with getNuclearFuel
        startQueue.async {
            startGroup.enter()
            starEngine.startEngine(with: fuel)
            startGroup.leave()
        }
        
        //TODO: bind with getNuclearFuel
        startQueue.async {
            startGroup.enter()
            starElectricSystem.startElectricSystem(with: fuel)
            startGroup.leave()
        }
        
        startQueue.async {
            startGroup.enter()
            //TODO: make checkOxigenSystem return true or false?
            starOxigenSystem.checkOxigenSystem()
            startGroup.leave()
        }
        
        //TODO: bind with checkOxigenSystem
        startQueue.async {
            startGroup.enter()
            starOxigenSystem.startOxigenSystem()
            startGroup.leave()
        }
        
        startQueue.async {
            startGroup.enter()
            starWeapons.prepareWeapon()
            startGroup.leave()
        }
        
        
        startQueue.async {
            startGroup.enter()
            starNavigation.calculateTransition()
            startGroup.leave()
        }
        
        startGroup.notify(queue: startQueue) {
            DispatchQueue.main.async {
                print("Star of Death is Ready")
            }
            readySign = "READY"
            completion(readySign)
        }
    }
}
*/

final class StarEngine {
    func startEngine(with fuel: NuclearFuel) {
        sleep(UInt32.random(in: 1...3))
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
        print(#function)
        sleep(UInt32.random(in: 1...3))
        return NuclearFuel(energy: 1_000_000_000_000)
    }
}

final class StarWeapons {
    func prepareWeapon() {
        sleep(UInt32.random(in: 1...3))
        print("Weapon is ready")
    }
}

final class StarNavigation {
    func calculateTransition() {
        sleep(UInt32.random(in: 1...3))
        print("Route is calculated")
    }
}

final class StarOxigenSystem {
    func checkOxigenSystem() {
        sleep(UInt32.random(in: 1...3))
        print("OxigenSystem did check")
    }
    
    func startOxigenSystem() {
        sleep(UInt32.random(in: 1...3))
        print("OxigenSystem did start")
    }
}

final class StarElectricSystem {
    func startElectricSystem (with fuel: NuclearFuel) {
        sleep(UInt32.random(in: 1...3))
        print("Power is \(fuel.energy)")
        print("ElectricSystem is ready")
        print("ElectricSystem is started")
    }
}


