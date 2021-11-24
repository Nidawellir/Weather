//
//  Main+weatherConditions.swift
//  WeatherApp
//
//  Created by Алексей on 22.11.2021.
//

import Foundation

extension Main {
    var weatherConditions: String {
        switch self {
        case .clear:
            return Localizations.WeatherConditions.clear
        case .clouds:
            return Localizations.WeatherConditions.clouds
        case .snow:
            return Localizations.WeatherConditions.snow
        case .atmosphere:
            return Localizations.WeatherConditions.atmosphere
        case .rain:
            return Localizations.WeatherConditions.rain
        case .drizzle:
            return Localizations.WeatherConditions.drizzle
        case .thunderstorm:
            return Localizations.WeatherConditions.thunderstorm
        }
    }
}
