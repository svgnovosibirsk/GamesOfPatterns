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
    var labelText = Bindable("❄️❄️❄️❄️❄️❄️❄️❄️❄️❄️")
    
    func chooseButtonDidPress() {
        labelText.value = "🎄" // TEST NewYear, Christmas, Easter, Helloween, Thanksgivenday, Laborday
    }
}
