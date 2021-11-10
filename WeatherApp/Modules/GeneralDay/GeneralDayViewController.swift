//
//  GeneralDayViewController.swift
//  WeatherApp
//
//  Created by Алексей on 10.11.2021.
//

import UIKit

final class GeneralDayViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let generalDayView = GeneralDayView()
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        view = generalDayView
    }
}
