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
    func createWeaponName() -> String
    func createWeaponImage() -> UIImage
    func createColor() -> UIColor
}

class LeonardoFactory : TurtleFactory {
    func createImage() -> UIImage {
        ImagesProvider.tmntLeonardo
    }
    
    func createName() -> String {
        "Leonardo"
    }
    
    func createWeaponName() -> String {
        "Katana"
    }
    
    func createWeaponImage() -> UIImage {
        ImagesProvider.tmntKatana
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
    
    func createWeaponName() -> String {
        "Bo"
    }
    
    func createWeaponImage() -> UIImage {
        ImagesProvider.tmntBo
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
    
    func createWeaponName() -> String {
        "Sai"
    }
    
    func createWeaponImage() -> UIImage {
        ImagesProvider.tmntSai
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
    
    func createWeaponName() -> String {
        "Nunchaku"
    }
    
    func createWeaponImage() -> UIImage {
        ImagesProvider.tmntNunchaku
    }
    
    func createColor() -> UIColor {
        .systemYellow
    }
}
