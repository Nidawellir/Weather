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
    func getDaylyWeather(lat: String, lon: String, completionHandler: @escaping (Result<DaylyWeather, NetworkingError>) -> Void) {
        networking.getRequest(
            to: "https://api.openweathermap.org/data/2.5/onecall",
            with: [
                "lat": lat,
                "lon": lon,
                "appid": "11773c489c3c2aedbb4ddb58cb38be33",
                "units": "metric",
                "lang": "ru"
            ],
            completionHandler: completionHandler)
    }
}
