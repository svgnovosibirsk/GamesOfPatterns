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
    func createColor() -> UIColor
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
    
    func createColor() -> UIColor {
        .systemBlue
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
    
    func createColor() -> UIColor {
        .systemPurple
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
    
    func createColor() -> UIColor {
        .systemRed
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
    
    func createColor() -> UIColor {
        .systemYellow
    }
}
