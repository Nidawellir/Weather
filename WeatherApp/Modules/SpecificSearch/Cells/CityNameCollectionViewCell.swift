//
//  CityNameCollectionViewCell.swift
//  WeatherApp
//
//  Created by Алексей on 23.11.2021.
//

import UIKit

final class CityNameCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants

    private enum Constants {
        static let roundedContainerViewCornerRadius: CGFloat = 8.0
    }
    
    // MARK: - Views properties
    
    private let roundedContainerView = UIView()
    private let cityNameLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension CityNameCollectionViewCell {
    func set(cityName: String) {
        cityNameLabel.text = cityName
    }
}

// MARK: - Private methods

extension CityNameCollectionViewCell {
    private func configureViews() {
        roundedContainerView.backgroundColor = Asset.Colors.Search.buttonCollor.color
        roundedContainerView.layer.cornerRadius = Constants.roundedContainerViewCornerRadius
        roundedContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        cityNameLabel.textColor = Asset.Colors.Common.black.color
        cityNameLabel.textAlignment = .center
        cityNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureLayouts() {
        contentView.addSubview(roundedContainerView)
                
        roundedContainerView.addSubview(cityNameLabel)
        
        NSLayoutConstraint.activate([
            roundedContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            roundedContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            roundedContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            roundedContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            cityNameLabel.topAnchor.constraint(equalTo: roundedContainerView.topAnchor),
            cityNameLabel.bottomAnchor.constraint(equalTo: roundedContainerView.bottomAnchor),
            cityNameLabel.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor),
            cityNameLabel.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor),
        ])
    }
}
