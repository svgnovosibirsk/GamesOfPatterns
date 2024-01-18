//
//  ProxiViewModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 18.01.2024.
//

import Foundation

protocol IProxiViewModel {
    var labelText: Bindable<String> { get }
    func chooseButtonDidPress()
}

final class ProxiViewModel: IProxiViewModel {
    
    private let holidaysModel = ProxyHolidaysModel()
    
    var labelText = Bindable("❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️")
    
    func chooseButtonDidPress() {
        labelText.value = holidaysModel.getHoliday()
    }
    
    
}
