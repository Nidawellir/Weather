//
//  SpecificSearchViewController.swift
//  WeatherApp
//
//  Created by Алексей on 24.11.2021.
//

import UIKit

final class SpecificSearchViewController: UIViewController {
    
    // MARK: - Usecase properties
    
    // MARK: - Views properties
    
    private let specificSearchView = SpecificSearchView()
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        specificSearchView.delegate = self
        
        view = specificSearchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Lifecycle methods
    
    override func viewDidLayoutSubviews() {
        specificSearchView.show()
    }
}

// MARK: - SpecificSearchViewDelegate

extension SpecificSearchViewController: SpecificSearchViewDelegate {
    func didTapCancelButton() {
        dismiss(animated: false)
    }
    
    func didTapConfirmButton() {
        
    }
}
