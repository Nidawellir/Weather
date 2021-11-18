//
//  WeatherGateway.swift
//  WeatherApp
//
//  Created by Алексей on 11/18/21.
//

protocol WeatherGateway {
    func getCurrentWeather(for cityID: String, completionHandler: @escaping (Result<CurrentWeather, NetworkingError>) -> Void)
}
