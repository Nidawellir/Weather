//
//  WeatherGateway.swift
//  WeatherApp
//
//  Created by Алексей on 11/18/21.
//

protocol WeatherGateway {
    func getDaylyWeather(lat: String, lon: String, completionHandler: @escaping (Result<DaylyWeather, NetworkingError>) -> Void)
}
