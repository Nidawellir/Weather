//
//  GetCurrentWeatherUsecase.swift
//  WeatherApp
//
//  Created by Алексей on 11/18/21.
//

final class GetCurrentWeatherUsecase {
    
    // MARK: - Private properties
    
    private let weatherGateway: WeatherGateway = WeatherGatewayImp()
}

extension GetCurrentWeatherUsecase {
    func execute(for cityID: String, completionHandler: @escaping (Result<CurrentWeather, NetworkingError>) -> Void) {
        weatherGateway.getCurrentWeather(for: cityID, completionHandler: completionHandler)
    }
}
