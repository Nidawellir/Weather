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
            return "ясно"
        case .clouds:
            return "облачно"
        case .snow:
            return "снег"
        case .atmosphere:
            return "атмосферные явления"
        case .rain:
            return "дождь"
        case .drizzle:
            return "морось"
        case .thunderstorm:
            return "гроза"
        }
    }
}
