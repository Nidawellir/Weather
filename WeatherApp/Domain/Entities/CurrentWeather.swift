//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Алексей on 11/18/21.
//

import Foundation

struct CurrentWeather: Codable {
    let main: Main
}

struct Main: Codable {
    let temperature: Double
    let temperatureFeelsLike: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureFeelsLike = "feels_like"
    }
}
