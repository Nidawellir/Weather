//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Алексей on 12.11.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureNavigationBar()
    }
    
    func didTapBarButton(with barButtonItem: BarButtonItem) {}
}

// MARK: - Public methods

extension BaseViewController {
    func setLeft(barButtonItems: [BarButtonItem]) {
        navigationItem.leftBarButtonItems = configureBarButtonItems(from: barButtonItems)
    }
    
    func setRight(barButtonItems: [BarButtonItem]) {
        navigationItem.rightBarButtonItems = configureBarButtonItems(from: barButtonItems)
    }
}

// MARK: - Private methods

extension BaseViewController {
    private func configureViews() {
        view.backgroundColor = .white
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func configureBarButtonItems(from barButtonItems: [BarButtonItem]) -> [UIBarButtonItem] {
        barButtonItems.map { barButtonItem in
            let barButton = BarButton(barButtonItem: barButtonItem)
            
            barButton.setImage(barButtonItem.image, for: .normal)
            barButton.addTarget(self, action: #selector(didTap(barButton:)), for: .touchUpInside)
            
            return UIBarButtonItem(customView: barButton)
        }
    }
    
    @objc private func didTap(barButton: BarButton) {
        didTapBarButton(with: barButton.barButtonItem)
    }
}
