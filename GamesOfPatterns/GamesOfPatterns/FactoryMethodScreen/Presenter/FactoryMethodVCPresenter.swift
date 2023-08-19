//
//  FactoryMethodVCPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 19.08.2023.
//

import UIKit

class FactoryMethodVCPresenter: NSObject {
    var viewController: FactoryMethodViewController!
    var fighterType = FightersTypes.scorpion
    lazy var fighterCreater = FighterCreater()
    var selectedFighter: FighterProtocol?
    
    init(viewController: FactoryMethodViewController!) {
        self.viewController = viewController
    }
    
    func createFighterButtonPressed() {
        print("\(fighterType.rawValue) is created")
        
        let fighter = fighterCreater.getFighter(type: fighterType)
        viewController.fighterImageView.image = fighter.image
    }
    
    func attackButtonPressed() {
        print(#function)
        
        // MARK: - Factory method
//        let fighter = fighterCreater.getFighter(type: fighterType)
//        viewController.attackLabel.text = fighter.attack()
        
        viewController.attackLabel.text = selectedFighter?.attack()
    }
}

extension FactoryMethodVCPresenter: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        FightersTypes.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        FightersTypes.allCases[row].rawValue
    }
}

extension FactoryMethodVCPresenter: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fighterType = FightersTypes.allCases[row]
        
        // MARK: - Factory method
        let fighter = fighterCreater.getFighter(type: fighterType)
        viewController.fighterImageView.image = fighter.image

        selectedFighter = fighter
    }
}
