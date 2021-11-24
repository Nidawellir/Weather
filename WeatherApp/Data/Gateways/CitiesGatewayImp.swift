//
//  CitiesGatewayImp.swift
//  WeatherApp
//
//  Created by Алексей on 24.11.2021.
//

import Foundation

final class CitiesGatewayImp {
    
    // MARK: - Private properties
    
    private var cities: [City]?
    private let jsonDecoder = JSONDecoder()
}

// MARK: - Public methods

extension CitiesGatewayImp: CitiesGateway {
    func search(by searchText: String) -> [City] {
        if let cities = cities {
            var specificCity: City?
            
            let cities = cities.filter { city in
                let isConstains = city.name.lowercased().contains(searchText.lowercased())
                let isCountEqual = city.name.count == searchText.count
                
                if isConstains && isCountEqual {
                    specificCity = city
                }
                
                return isConstains
            }
            
            return specificCity != nil ? [specificCity!] : cities
        } else {
            getCitiesFromJSON()
            return search(by: searchText)
        }
    }
}

// MARK: - Private methods

extension CitiesGatewayImp {
    private func getCitiesFromJSON() {
        let path = Bundle.main.path(forResource: "cityList", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let cities = try! jsonDecoder.decode([City].self, from: data)
        
        self.cities = cities
    }
}
