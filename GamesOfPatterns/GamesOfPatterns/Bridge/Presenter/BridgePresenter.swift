//
//  BridgePresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 21.10.2023.
//

import Foundation

final class BridgePresenter {
    let viewController: BridgeViewController!
    var weatherService: WeatherServiceProtocol?
    
    init(viewController: BridgeViewController?) {
        self.viewController = viewController
        
        setupWeatherService()
    }
    
    // MARK: - Bridge
    // MARK: Setup Screen
    func setupRendomScreen() {
        let randomNumber = Int.random(in: 1...100)
        
        if randomNumber.isMultiple(of: 2) {
            viewController.setupBackgroundView(image: ImagesProvider.airBackground2)
            viewController.setupStackView()
            viewController.setupTemperatureLabel()
            viewController.setupGetTemperarureButton()
        } else {
            viewController.setupBackgroundView(image: ImagesProvider.airBackground1)
            viewController.setupStackView()
            viewController.setupGetTemperarureButton()
            viewController.setupTemperatureLabel()
        }
    }
    
    // MARK: - Bridge
    // MARK: - Setup Weather Service
    private func setupWeatherService() {
        let randomNumber = Int.random(in: 1...100)
        if randomNumber.isMultiple(of: 2) {
            weatherService = WeatherServiceFirst()
        } else {
            weatherService = WeatherServiceSecond()
        }
    }
    
    func getTemperatureButtonPressed() {
        setupWeatherService()
        getWeatherFromService()
    }
    
    private func getWeatherFromService() {
        weatherService?.getTemperature { [weak self] temp in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.setWeatherLabel(weather: temp)
            }
        }
    }
    
    private func setWeatherLabel(weather: Double) {
        viewController.temperatureLabel.text = "\(weather) C"
    }
}
