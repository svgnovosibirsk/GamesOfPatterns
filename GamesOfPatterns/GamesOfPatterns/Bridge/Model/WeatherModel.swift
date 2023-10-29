//
//  WeatherModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 21.10.2023.
//

import UIKit
import Combine

protocol WeatherServiceProtocol {
    func getWeather() -> Double
    func getTemperature(completion: @escaping (Double) -> ())
}

final class WeatherServiceFirst: WeatherServiceProtocol {
    // MARK: Mocking realization
    func getWeather() -> Double {
        return 30.5
    }
    
    // MARK: Real service realization
    func getTemperature(completion: @escaping (Double) -> ()) {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,windspeed_10m&hourly=temperature_2m,relativehumidity_2m,windspeed_10m"
        
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
                if let dictionary = json as? [String: Any] {
                    if let current = dictionary["current"] as? [String: Any] {
                        if let temperature = current["temperature_2m"] as? Double {
                            completion(temperature)
                        }
                    }
                }
            }
        }
        task.resume()
    }
}

final class WeatherServiceSecond: WeatherServiceProtocol {
    // MARK: Mocking realization
    func getWeather() -> Double {
        return -10.2
    }
    
    // MARK: decode OpenMeteoResponse realization
    func getTemperature(completion: @escaping (Double) -> ()) {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=38.48&longitude=28.94&current=temperature_2m,windspeed_10m&hourly=temperature_2m,relativehumidity_2m,windspeed_10m"
        
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let meteoResponse = try? JSONDecoder().decode(OpenMeteoResponse.self, from: data) {
                    completion(meteoResponse.current.temperature2M)
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
}

final class WeatherServiceThird: WeatherServiceProtocol {
    // MARK: Mocking realization
    func getWeather() -> Double {
        return 34.7
    }
    
    // MARK: async/await realization
    func getTemperature(completion: @escaping (Double) -> ()) {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=18.18&longitude=48.44&current=temperature_2m,windspeed_10m&hourly=temperature_2m,relativehumidity_2m,windspeed_10m"
        
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(for: request)

                if let meteoResponse = try? JSONDecoder().decode(OpenMeteoResponse.self, from: data) {
                    completion(meteoResponse.current.temperature2M)
                } else {
                    print("Invalid Response")
                }
            } catch {
                print("Failed to Send POST Request \(error)")
            }
        }
    }
}

final class WeatherServiceFourth: WeatherServiceProtocol {
    var cancellables = Set<AnyCancellable>()
    
    // MARK: Mocking realization
    func getWeather() -> Double {
        return -1.3
    }
    
    // MARK: combine realization
    func getTemperature(completion: @escaping (Double) -> ()) {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=88.18&longitude=78.44&current=temperature_2m,windspeed_10m&hourly=temperature_2m,relativehumidity_2m,windspeed_10m"
        
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        let _ = URLSession.shared.dataTaskPublisher(for: request)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    ()
                case .failure(let error):
                    print("Failed to Send GET Request \(error)")
                }
            }, receiveValue: { data, _ in
                if let meteoResponse = try? JSONDecoder().decode(OpenMeteoResponse.self, from: data) {
                    completion(meteoResponse.current.temperature2M)
                } else {
                    print("Invalid Response")
                }
            }).store(in: &cancellables)
    }
}
