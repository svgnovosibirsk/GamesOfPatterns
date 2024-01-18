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

final class ProxyHolidaysModel: IHolidaysModel {
    private let holidaysModel: IHolidaysModel
    
    init(holidaysModel: IHolidaysModel) {
        self.holidaysModel = holidaysModel
    }
    
    func getHoliday() -> String {
        holidaysModel.getHoliday()
    }
}
