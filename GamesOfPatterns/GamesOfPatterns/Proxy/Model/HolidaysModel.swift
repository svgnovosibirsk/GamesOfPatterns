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
        var decorator = getDecorator(for: text)
        let decorOperation = DecorationOperation()
        decorOperation.inputStr = text
        decorOperation.decorator = decorator
        decorOperation.start()
        return decorOperation.outputStr
    }
    
    private func getDecorator(for text: String) -> String {
        switch text {
        case "Christmass": return "🎄"
        case "Easter": return "🥚"
        case "Helloween": return "🎃"
        default: return "❄️"
        }
    }
}

class DecorationOperation: Operation {
    var inputStr: String?
    var outputStr = ""
    var decorator = ""
    
    override func main() {
        outputStr = "\(decorator) \(inputStr!) \(decorator)"
    }
}
