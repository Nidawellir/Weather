//
//  SpecificSearchViewController.swift
//  WeatherApp
//
//  Created by Алексей on 24.11.2021.
//

import UIKit

final class SpecificSearchViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var confirmClosure: ((City) -> Void)?
    
    // MARK: - Usecase properties
    
    private let searchCityBySearchTextUsecase = SearchCityBySearchTextUsecase()
    
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

// MARK: - Public methods

extension SpecificSearchViewController {
    func set(confirmClosure: @escaping (City) -> Void) {
        self.confirmClosure = confirmClosure
    }
}

// MARK: - SpecificSearchViewDelegate

extension SpecificSearchViewController: SpecificSearchViewDelegate {
    func didChange(searchText: String) {
        specificSearchView.set(cities: searchCityBySearchTextUsecase.execute(searchText: searchText))
    }
    
    func didTapCancelButton() {
        dismiss(animated: false)
    }
    
    func didTapConfirmButton(with city: City) {
        dismiss(animated: false)
        
        confirmClosure?(city)
    }
}
