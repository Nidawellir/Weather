//
//  GeneralDayViewController.swift
//  WeatherApp
//
//  Created by Алексей on 10.11.2021.
//

import UIKit

final class GeneralDayViewController: BaseViewController {
    
    // MARK: - Usecase properties
    
    private let getDaylyWeatherUsecase = GetDaylyWeatherUsecase()
    
    // MARK: - Views properties
    
    private let generalDayView = GeneralDayView()
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        title = "Краснодар"
        view = generalDayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setLeft(barButtonItems: [.location])
        setRight(barButtonItems: [.loader, .search])
        
        getDaylyWeatherUsecase.execute(lon: "38.9769", lat: "45.0328") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(daylyWeather):
                self.generalDayView.set(daylyWeather: daylyWeather)
            case let .failure(error):
                print(error)
            }
        }
    }
}
