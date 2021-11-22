//
//  DaylyWeather.swift
//  WeatherApp
//
//  Created by Алексей on 19.11.2021.
//

import Foundation

struct DaylyWeather: Codable {
    let current: Current
    let daily: [Daily]
    let hourly: [Hourly]
}
