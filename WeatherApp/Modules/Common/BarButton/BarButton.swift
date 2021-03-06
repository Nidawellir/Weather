//
//  BarButton.swift
//  WeatherApp
//
//  Created by Алексей on 12.11.2021.
//

import UIKit

final class BarButton: UIButton {
    
    // MARK: - Public properties
    
    let barButtonItem: BarButtonItem
    
    // MARK: - Initialization
    
    init(barButtonItem: BarButtonItem) {
        self.barButtonItem = barButtonItem

        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
