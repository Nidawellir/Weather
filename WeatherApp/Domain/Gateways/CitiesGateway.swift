//
//  CitiesGateway.swift
//  WeatherApp
//
//  Created by Алексей on 24.11.2021.
//

import Foundation

protocol CitiesGateway {
    func search(by searchText: String) -> [City]
}
