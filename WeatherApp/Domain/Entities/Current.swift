//
//  Current.swift
//  WeatherApp
//
//  Created by Алексей on 22.11.2021.
//

import Foundation

struct Current: Codable {
    let dateTime: Double
    let temperature: Double
    let feelsLike: Double
    let weather: [Weather]
    
    private enum CodingKeys: String, CodingKey {
        case dateTime = "dt"
        case temperature = "temp"
        case feelsLike = "feels_like"
        case weather
    }
}
