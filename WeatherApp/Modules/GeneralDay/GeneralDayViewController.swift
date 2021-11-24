//
//  GeneralDayViewController.swift
//  WeatherApp
//
//  Created by Алексей on 10.11.2021.
//

import UIKit

final class GeneralDayViewController: BaseViewController {
    
    // MARK: - Private properties

    private var city = City(coordinate: Coordinate(lat: "52.71667", lon: "41.43333"), name: "Тамбов") // Поставил Тамбов базовым значением, что бы первые данные были получены
    
    // MARK: - Usecase properties
    
    private let getDaylyWeatherUsecase = GetDaylyWeatherUsecase()
    
    // MARK: - Views properties
    
    private let generalDayView = GeneralDayView()
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        view = generalDayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setRight(barButtonItems: [.search])
        getDaylyWeather()
    }
    
    override func didTapBarButton(with barButtonItem: BarButtonItem) {
        switch barButtonItem {
        case .search:
            let specificSearchViewController = SpecificSearchViewController()
            specificSearchViewController.set(confirmClosure: updateCity)
            specificSearchViewController.modalPresentationStyle = .custom
            
            navigationController?.present(specificSearchViewController, animated: false)
        default:
            break
        }
    }
}

extension GeneralDayViewController {
    private func getDaylyWeather() {
//        guard let city = city else { return } // Верну если базовый город не будет указан по умолчанию
        
        title = city.name
        
        getDaylyWeatherUsecase.execute(lon: city.coordinate.lon, lat: city.coordinate.lat) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(daylyWeather):
                self.generalDayView.set(daylyWeather: daylyWeather)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    private func updateCity(on city: City) {
        self.city = city
        
        getDaylyWeather()
    }
}
