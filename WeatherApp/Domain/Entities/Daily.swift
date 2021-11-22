//
//  Daily.swift
//  WeatherApp
//
//  Created by Алексей on 22.11.2021.
//

import Foundation

struct Daily: Codable {
    let dateTime: Double
    let temperature: Temp
    let weather: [Weather]

    private enum CodingKeys: String, CodingKey {
        case dateTime = "dt"
        case temperature = "temp"
        case weather
    }
}
