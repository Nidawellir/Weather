//
//  Hourly.swift
//  WeatherApp
//
//  Created by Алексей on 22.11.2021.
//

import Foundation

struct Hourly: Codable {
    let dateTime: Double
    let temperature: Double
    let weather: [Weather]
    
    private enum CodingKeys: String, CodingKey {
        case dateTime = "dt"
        case temperature = "temp"
        case weather
    }
}
