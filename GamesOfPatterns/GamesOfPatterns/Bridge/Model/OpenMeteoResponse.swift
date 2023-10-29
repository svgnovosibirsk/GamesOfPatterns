//
//  OpenMeteoResponse.swift
//  GamesOfPatterns
//
//  Created by Sergey on 22.10.2023.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let openMeteoResponse = try? JSONDecoder().decode(OpenMeteoResponse.self, from: jsonData)

import Foundation

// MARK: - OpenMeteoResponse
struct OpenMeteoResponse: Codable {
    let current: Current
}

// MARK: - Current
struct Current: Codable {
    let temperature2M: Double

    enum CodingKeys: String, CodingKey {
        case temperature2M = "temperature_2m"
    }
}
