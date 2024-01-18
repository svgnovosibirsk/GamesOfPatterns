//
//  HolidaysModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 18.01.2024.
//

import Foundation

protocol IHolidaysModel {
    func getHoliday() -> String
}

final class HolidaysModel: IHolidaysModel {
    let holidays = ["New Year", "Christmass", "Easter", "Helloween"]
    
    func getHoliday() -> String {
        return holidays.randomElement()!
    }
}

// MARK: - Proxy
final class ProxyHolidaysModel: IHolidaysModel {
    private let holidaysModel = HolidaysModel()
    
    func getHoliday() -> String {
        decorate(text: holidaysModel.getHoliday())
    }
    
    private func decorate(text: String) -> String {
        
        return text
    }
}
