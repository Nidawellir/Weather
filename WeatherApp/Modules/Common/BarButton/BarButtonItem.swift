//
//  BarButtonItem.swift
//  WeatherApp
//
//  Created by Алексей on 12.11.2021.
//

import UIKit

enum BarButtonItem {
    case location
    case sun
    case search
}

extension BarButtonItem {
    var image: UIImage {
        switch self {
        case .location:
            return UIImage(named: "NavigationBarButtons/location") ?? UIImage()
        case .sun:
            return UIImage(named: "NavigationBarButtons/sun") ?? UIImage()
        case .search:
            return UIImage(named: "NavigationBarButtons/search") ?? UIImage()
        }
    }
}
