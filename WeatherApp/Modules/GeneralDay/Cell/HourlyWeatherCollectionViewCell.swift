//
//  HourlyWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Алексей on 15.11.2021.
//

import UIKit

final class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let roundedContainerViewCornerRadius: CGFloat = 16.0
        static let stackViewVerticalPadding: CGFloat = 12.0
    }
    
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

// MARK: - Public methods

extension HourlyWeatherCollectionViewCell {
    func set(dateTime: Double?) {
        if let dateTime = dateTime {
            let date = Date(timeIntervalSince1970: dateTime)
            let dateFormatter: DateFormatter = .init()
            
            dateFormatter.dateFormat = "HH:mm"
            dateFormatter.locale = Locale(identifier: "ru_RU")
            
            let dateString = dateFormatter.string(from: date)
            timeLabel.text = dateString
        } else {
            timeLabel.text = Localizations.Common.empty
        }
    }
    
    func set(temperature: Double?) {
        if let temperature = temperature {
            temperatureLabel.text = String(Int(temperature)) + Localizations.Common.celsius
        } else {
            temperatureLabel.text = Localizations.Common.empty
        }
    }
    
    func set(main: Main?) {
        if let main = main {
            weatherImageView.image = main.smallImage
        } else {
            weatherImageView.image = nil
        }
    }
}

// MARK: - Private methods

extension HourlyWeatherCollectionViewCell {
    private func configureViews() {
        roundedContainerView.backgroundColor = Asset.Colors.DailyWeather.HourlyWeather.roundedContainerViewBackground.color
        roundedContainerView.layer.cornerRadius = Constants.roundedContainerViewCornerRadius
        roundedContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.textColor = Asset.Colors.DailyWeather.titleColor.color
        timeLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
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
            
            stackView.topAnchor.constraint(equalTo: roundedContainerView.topAnchor, constant: Constants.stackViewVerticalPadding),
            stackView.bottomAnchor.constraint(equalTo: roundedContainerView.bottomAnchor, constant: -Constants.stackViewVerticalPadding),
            stackView.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor)
        ])
    }
}
