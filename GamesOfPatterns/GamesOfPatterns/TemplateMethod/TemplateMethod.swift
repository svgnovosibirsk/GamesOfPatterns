//
//  TemplateMethod.swift
//  GamesOfPatterns
//
//  Created by Sergey on 12.08.2024.
//

protocol ICharacter {
    // Templatte method
    func attack()
    
    // Base operations
    func seeEnemy()
    func takeWeapon()
    func attackEnemy()
    
    // Required operations
    func nameYourself()
    func nameWeapon()
    
    // Hooks
    func hookSound()
    func hookPlace()
}

extension ICharacter {
    func attack() {
        nameYourself()
        hookPlace()
        seeEnemy()
        takeWeapon()
        nameWeapon()
        attackEnemy()
        hookSound()
    }
    
    func seeEnemy() {
        print("I see my enemy.")
    }
    
    func takeWeapon() {
        print("I took my weapon.")
    }
    
    func attackEnemy() {
        print("I'm attacking the enemy.")
    }
    
    func hookSound() {}
    func hookPlace() {}
}

final class Knight: ICharacter {
    func nameYourself() {
        print("I'm knight.")
    }
    
    func nameWeapon() {
        print("My weapon is sword.")
    }
    
    func hookSound() {
        print("A-a-a-a-a-a!")
    }
    
    func hookPlace() {
        print("I'm from the castle.")
    }
}

final class GreenOrk: ICharacter {
    func nameYourself() {
        print("I'm Ork.")
    }
    
    func nameWeapon() {
        print("My weapon is axe.")
    }
    
    func hookSound() {
        print("R-r-r-r-r-r!")
    }
    
    func hookPlace() {
        print("I'm from the forest.")
    }
}
