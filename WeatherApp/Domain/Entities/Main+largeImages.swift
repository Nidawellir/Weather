//
//  Main+largeImages.swift
//  WeatherApp
//
//  Created by Алексей on 22.11.2021.
//

import UIKit

extension Main {
    var largeImage: UIImage {
        switch self {
        case .clear, .clouds, .atmosphere:
            return Asset.Images.Weather.Large.sun.image
        case .snow, .rain, .drizzle:
            return Asset.Images.Weather.Large.rain.image
        case .thunderstorm:
            return Asset.Images.Weather.Large.thunder.image
        }
    }
}
