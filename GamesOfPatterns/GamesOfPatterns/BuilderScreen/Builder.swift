//
//  Builder.swift
//  GamesOfPatterns
//
//  Created by Sergey on 23.09.2023.
//

import UIKit

protocol SWBuilderProtocol {
    func reset()
    func setName(_ name: String)
    func setSwordColor(_ color: UIColor)
    func setImage(_ image: UIImage)
}

final class JediBuilder: SWBuilderProtocol {
    private var jedi = Jedi()
    
    func reset() {
        jedi = Jedi()
    }
    
    func setName(_ name: String) {
        jedi.name = name
    }
    
    func setSwordColor(_ color: UIColor) {
        jedi.swordColor = color
    }
    
    func setImage(_ image: UIImage) {
        jedi.image = image
    }
    
    func getJedi() -> Jedi {
        return jedi
    }
}

final class SithBuilder: SWBuilderProtocol {
    private var sith = Sith()
    
    func reset() {
        sith = Sith()
    }
    
    func setName(_ name: String) {
        sith.name = name
    }
    
    func setSwordColor(_ color: UIColor) {
        sith.swordColor = color
    }
    
    func setImage(_ image: UIImage) {
        sith.image = image
    }
    
    func getJedi() -> Sith {
        return sith
    }
}
