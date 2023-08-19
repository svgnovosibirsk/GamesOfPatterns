//
//  FactoryMethodVCPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 19.08.2023.
//

import UIKit

class FactoryMethodVCPresenter: NSObject {
    var viewController: FactoryMethodViewController!
    let model = FightersModel()
    
    init(viewController: FactoryMethodViewController!) {
        self.viewController = viewController
    }
}

extension FactoryMethodVCPresenter: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        model.fighters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        model.fighters[row]
    }
}

extension FactoryMethodVCPresenter: UIPickerViewDelegate {
    
}
