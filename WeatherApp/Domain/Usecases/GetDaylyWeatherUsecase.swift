//
//  GetDaylyWeatherUsecase.swift
//  WeatherApp
//
//  Created by Алексей on 19.11.2021.
//

final class GetDaylyWeatherUsecase {
    
    // MARK: - Private properties
    
    private let weatherGateway: WeatherGateway = WeatherGatewayImp()
}

// MARK: - Public methods

extension GetDaylyWeatherUsecase {
    func execute(lon: String, lat: String, completionHandler: @escaping (Result<DaylyWeather, NetworkingError>) -> Void) {
        weatherGateway.getDaylyWeather(lat: lat, lon: lon, completionHandler: completionHandler)
    }
}
