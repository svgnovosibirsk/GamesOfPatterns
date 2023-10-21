//
//  WeatherModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 21.10.2023.
//

import Foundation

protocol WeatherServiceProtocol {
    func getWeather() -> Int
}

// TODO: Implement real weather API
final class WeatherServiceFirst: WeatherServiceProtocol {
    func getWeather() -> Int {
        return 30
    }
}

// TODO: Implement real weather API
final class WeatherServiceSecond: WeatherServiceProtocol {
    func getWeather() -> Int {
        return -10
    }
}
