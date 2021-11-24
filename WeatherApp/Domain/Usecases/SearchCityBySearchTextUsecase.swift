//
//  SearchCityBySearchTextUsecase.swift
//  WeatherApp
//
//  Created by Алексей on 24.11.2021.
//

final class SearchCityBySearchTextUsecase {
    
    // MARK: - Private properties
    
    private let citiesGateway: CitiesGateway = CitiesGatewayImp()
}

// MARK: - Public methods

extension SearchCityBySearchTextUsecase {
    func execute(searchText: String) -> [City] {
        citiesGateway.search(by: searchText)
    }
}
