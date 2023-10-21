//
//  BridgePresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 21.10.2023.
//

import Foundation

final class BridgePresenter {
    let viewController: BridgeViewController!
    var weatherService: WeatherServiceProtocol!
    
    init(viewController: BridgeViewController?) {
        self.viewController = viewController
        
        setupWeatherService()
    }
    
    func getTemperarureButtonPressed() {
        setupWeatherService()
        let weather = getWeatherFromService()
        setWeatherLabel(weather: weather)
    }
    
    func getWeatherFromService() -> Int {
        return weatherService.getWeather()
    }
    
    func setWeatherLabel(weather: Int) {
        viewController.temperatureLabel.text = "\(weather) C"
    }
    
    // MARK: - Private methods
    private func setupWeatherService() {
        let randomNumber = Int.random(in: 1...100)
        if randomNumber.isMultiple(of: 2) {
            weatherService = WeatherServiceFirst()
        } else {
            weatherService = WeatherServiceSecond()
        }
    }
}
