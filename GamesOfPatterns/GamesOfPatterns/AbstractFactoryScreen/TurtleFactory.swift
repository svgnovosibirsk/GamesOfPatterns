//
//  TurtleFactory.swift
//  GamesOfPatterns
//
//  Created by Sergey on 26.08.2023.
//

import UIKit

protocol TurtleFactory {
    func createImage() -> UIImage
    func createName() -> String
    func createWeapon() -> String
}

class LeonardoFactory : TurtleFactory {
    func createImage() -> UIImage {
        ImagesProvider.tmntLeonardo
    }
    
    func createName() -> String {
        "Leonardo"
    }
    
    func createWeapon() -> String {
        "Katana"
    }
}

class DonatelloFactory : TurtleFactory {
    func createImage() -> UIImage {
        ImagesProvider.tmntDonatello
    }
    
    func createName() -> String {
        "Donatello"
    }
    
    func createWeapon() -> String {
        "Bo"
    }
}

class RaphaelFactory : TurtleFactory {
    func createImage() -> UIImage {
        ImagesProvider.tmntRaphael
    }
    
    func createName() -> String {
        "Raphael"
    }
    
    func createWeapon() -> String {
        "Sai"
    }
}

class MichelangeloFactory : TurtleFactory {
    func createImage() -> UIImage {
        ImagesProvider.tmntMichelangelo
    }
    
    func createName() -> String {
        "Michelangelo"
    }
    
    func createWeapon() -> String {
        "Nunchaku"
    }
}
