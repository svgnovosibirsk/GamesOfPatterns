//
//  FightersModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 19.08.2023.
//

import UIKit

// MARK: - Fighter's types
enum FightersTypes: String, CaseIterable {
    case scorpion = "Scorpion"
    case subzero = "Subzero"
}

// MARK: - Fighters
protocol FighterProtocol {
    var name: String { get }
    var image: UIImage { get }
    var color: UIColor { get }
    
    func attack() -> String
}

struct Scorpion: FighterProtocol {
    let name = "Scorpion"
    let image = ImagesProvider.mkScorpion
    let color = UIColor.systemYellow
    
    func attack() -> String {
        print("Come over here 🔥!!!")
        return "Come over here 🔥!!!"
    }
}

struct SubZero: FighterProtocol {
    let name = "Sub-Zero"
    let image = ImagesProvider.mkSubzero
    let color = UIColor.systemBlue
    
    func attack() -> String {
        print("I'm gona freeze you 🧊!!!")
        return "I'm gona freeze you 🧊!!!"
    }
}

// MARK: - Factory method
protocol FighterCreaterProtocol {
    func getFighter(type: FightersTypes) -> FighterProtocol
}

struct FighterCreater: FighterCreaterProtocol {
    func getFighter(type: FightersTypes) -> FighterProtocol {
        switch type {
        case .scorpion: return Scorpion()
        case .subzero: return SubZero()
        }
    }
}
