//
//  CityList.swift
//  WeatherApp
//
//  Created by Алексей on 24.11.2021.
//

import Foundation

struct City: Codable {
    let coordinate: Coordinate
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case coordinate = "coords"
        case name
    }
}
