//
//  RacingCarModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 01.01.2024.
//

import Foundation

final class RacingCarModel {
    private var maxSpeed = 0
    private var racingCar: RacingCar?
    private var racingEngine: RacingEngine?
    private var racingGas: RacingGas?
    private var racingNitro: RacingNitro?
    
    init() {
       createCar()
    }
    
    func getMaxSpeed() -> Int {
        maxSpeed
    }
    
    func createCar() {
        if racingCar == nil {
            racingCar = RacingCar(maxSpeed: 220)
            maxSpeed = racingCar!.getMaxSpeed()
        }
    }
    
    // MARK: - Decorator
    func addRacingEngine() {
        if racingEngine == nil {
            racingEngine = RacingEngine(component: racingCar!)
            maxSpeed = racingEngine!.getMaxSpeed()
        }
    }
    
    // MARK: - Decorator
    func addRacingGas() {
        if racingGas == nil {
            racingGas = RacingGas(component: racingEngine!)
            maxSpeed = racingGas!.getMaxSpeed()
        }
        
    }
    
    // MARK: - Decorator
    func addRacingNitro() {
        if racingNitro == nil {
            racingNitro = RacingNitro(component: racingGas!)
            maxSpeed = racingNitro!.getMaxSpeed()
        }
    }
}

// MARK: - Decorator
protocol Component {
    func getMaxSpeed() -> Int
}

final class RacingCar : Component {
    let maxSpeed: Int
    
    init(maxSpeed: Int) {
        self.maxSpeed = maxSpeed
    }
    
    func getMaxSpeed() -> Int {
        maxSpeed
    }
}

class Decorator: Component {
    private var component: Component
    
    init(component: Component) {
        self.component = component
    }
    
    func getMaxSpeed() -> Int {
        component.getMaxSpeed()
    }
}

final class RacingEngine: Decorator {
    override func getMaxSpeed() -> Int {
        super.getMaxSpeed() + 50
    }
}

final class RacingGas: Decorator {
    override func getMaxSpeed() -> Int {
        super.getMaxSpeed() + 20
    }
}

final class RacingNitro: Decorator {
    override func getMaxSpeed() -> Int {
        super.getMaxSpeed() + 30
    }
}
