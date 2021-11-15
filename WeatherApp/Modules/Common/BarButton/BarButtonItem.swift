//
//  BarButtonItem.swift
//  WeatherApp
//
//  Created by Алексей on 12.11.2021.
//

import UIKit

enum BarButtonItem {
    case location
    case loader
    case search
    case back
}

extension BarButtonItem {
    var image: UIImage {
        switch self {
        case .location:
            return Asset.Images.Common.location.image
        case .loader:
            return Asset.Images.Common.loader.image
        case .search:
            return Asset.Images.Common.search.image
        case .back:
            return Asset.Images.Common.back.image
        }
    }
}
