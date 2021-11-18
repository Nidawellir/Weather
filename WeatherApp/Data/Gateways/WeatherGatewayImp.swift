//
//  WeatherGatewayImp.swift
//  WeatherApp
//
//  Created by Алексей on 11/18/21.
//

final class WeatherGatewayImp {
    
    // MARK: - Private properties
    
    private let networking: Networking = NetworkingImp.shared
}

extension WeatherGatewayImp: WeatherGateway {
    func getCurrentWeather(for cityID: String, completionHandler: @escaping (Result<CurrentWeather, NetworkingError>) -> Void) {
        networking.getRequest(
            to: "https://api.openweathermap.org/data/2.5/weather",
            with: [
                "q": cityID,
                "appid": "11773c489c3c2aedbb4ddb58cb38be33",
                "units": "metric",
                "lang": "ru"
            ],
            completionHandler: completionHandler
        )
    }
}
