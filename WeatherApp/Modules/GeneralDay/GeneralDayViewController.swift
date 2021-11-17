//
//  GeneralDayViewController.swift
//  WeatherApp
//
//  Created by Алексей on 10.11.2021.
//

import UIKit

final class GeneralDayViewController: BaseViewController {
    
    // MARK: - Private properties
    
    private let generalDayView = GeneralDayView()
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        title = "Томбов"
        view = generalDayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setLeft(barButtonItems: [.location])
        setRight(barButtonItems: [.loader, .search])
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Krasnodar&appid=11773c489c3c2aedbb4ddb58cb38be33"
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            
            let test = try! JSONDecoder().decode(Test.self, from: data)
        }
        dataTask.resume()
    }
}

struct Test: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Coord: Codable {
    let lon: Int
    let lat: Int
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Int
    let grndLevel: Int
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

struct Clouds: Codable {
    let all: Int
}

struct Sys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
