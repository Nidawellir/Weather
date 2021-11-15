//
//  HourlyWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Алексей on 15.11.2021.
//

import UIKit

final class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views properties
    
    private let roundedContainerView = UIView()
    private let stackView = UIStackView()
    private let timeLabel = UILabel()
    private let weatherImageView = UIImageView()
    private let temperatureLabel = UILabel()
    
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

// MARK: - Private methods

extension HourlyWeatherCollectionViewCell {
    private func configureViews() {
        roundedContainerView.backgroundColor = Asset.Colors.DailyWeather.HourlyWeather.roundedContainerViewBackground.color
        roundedContainerView.layer.cornerRadius = 16
        roundedContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.text = "12:00"
        timeLabel.textColor = Asset.Colors.Common.black.color
        timeLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        weatherImageView.image = Asset.Images.Weather.Small.sun.image
        
        temperatureLabel.text = "25°"
        temperatureLabel.textColor = Asset.Colors.Common.black.color
        temperatureLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    private func configureLayouts() {
        contentView.addSubview(roundedContainerView)
        
        roundedContainerView.addSubview(stackView)
        
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(weatherImageView)
        stackView.addArrangedSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            roundedContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            roundedContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            roundedContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            roundedContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            stackView.topAnchor.constraint(equalTo: roundedContainerView.topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: roundedContainerView.bottomAnchor, constant: -12),
            stackView.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor, constant: 0)
        ])
    }
}
