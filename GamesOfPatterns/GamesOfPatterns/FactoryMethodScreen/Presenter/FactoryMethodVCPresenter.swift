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
        selectedFighter = fighter
    }
    
    func attackButtonPressed() {
        viewController.attackLabel.text = selectedFighter?.attack()
        
        guard let selectedFighter = selectedFighter else { return }
        showAttackAlert(with: selectedFighter)
    }
    
    // MARK: - Private methods
    
    private func setupControlsColors(with fighter: FighterProtocol) {
        viewController.fighterImageView.image = fighter.image
        viewController.attackLabel.textColor = fighter.color
        viewController.chooseFighterLabel.textColor = fighter.color
        viewController.createFighterButton.tintColor = fighter.color
        viewController.attackButton.tintColor = fighter.color
    }
    
    private func showAttackAlert(with fighter: FighterProtocol) {
        let alert = UIAlertController(title: "",
                                      message: fighter.attack(),
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Fight".uppercased(), style: .cancel)
        
        alert.addAction(action)
        
        viewController.presentAlert(alert)
    }
}

// MARK: - UIPickerViewDataSource

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

// MARK: - UIPickerViewDelegate

extension FactoryMethodVCPresenter: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fighterType = FightersTypes.allCases[row]
        
        viewController.attackLabel.text = ""
        
        // MARK: Factory method
        let fighter = fighterCreater.getFighter(type: fighterType)
        
        setupControlsColors(with: fighter)
        selectedFighter = fighter
    }
}
