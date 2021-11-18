//
//  GeneralDayViewController.swift
//  WeatherApp
//
//  Created by Алексей on 10.11.2021.
//

import UIKit

final class GeneralDayViewController: BaseViewController {
    
    // MARK: - Usecase properties
    
    private let getCurrentWeatherUsecase = GetCurrentWeatherUsecase()
    
    // MARK: - Views properties
    
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
        
        getCurrentWeatherUsecase.execute(for: "Krasnodar") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(currentWeather):
                self.title = String(currentWeather.main.temperature)
            case let .failure(error):
                print(error)
            }
        }
    }
}
