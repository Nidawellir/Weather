//
//  Main+smallImage.swift
//  WeatherApp
//
//  Created by Алексей on 22.11.2021.
//

import UIKit

extension Main {
    var smallImage: UIImage {
        switch self {
        case .clear, .clouds, .atmosphere:
            return Asset.Images.Weather.Small.sun.image
        case .snow, .rain, .drizzle:
            return Asset.Images.Weather.Small.rain.image
        case .thunderstorm:
            return Asset.Images.Weather.Small.thunder.image
        }
    }
}
