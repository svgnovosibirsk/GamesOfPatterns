//
//  Observer.swift
//  GamesOfPatterns
//
//  Created by Sergey on 29.07.2024.
//

import UIKit

// MARK: ObserverProtocol

protocol ObserverProtocol: AnyObject {
    func update(number: Int)
}

// MARK: Monitor

final class Monitor {
    var state = Int.random(in: 1...10)
    var observers = [ObserverProtocol]()
    
    func scan() {
        state = Int.random(in: 1...10)
    }
    
    func addObserver(observer: ObserverProtocol) {
        observers.append(observer)
    }
    
    func deliteObserver(observer: ObserverProtocol) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }
    
    func notify() {
        observers.forEach({ $0.update(number: state) })
    }
}

// MARK: Custom classes for labels

final class InfoLabel: UILabel, ObserverProtocol {
    func update(number: Int) {
        self.text = "Detected \(number) enemy."
    }
}

final class WeaponLabel: UILabel, ObserverProtocol {
    func update(number: Int) {
        if number > 7 {
            self.text = "Weapon is ready for Max"
        } else {
            self.text = "Weapon is ready"
        }
    }
}

final class ShieldLabel: UILabel, ObserverProtocol {
    func update(number: Int) {
        if number > 7 {
            self.text = "Shield is ready for Max"
        } else {
            self.text = "Shield is ready"
        }
    }
}
