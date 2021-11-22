//
//  CurrenWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Алексей on 15.11.2021.
//

import UIKit

final class CurrenWeatherTableViewCell: UITableViewCell {
    
    // MARK: - Views properties
    
    private let roundedContainereView = UIView()
    private let gradientView = UIView()
    private let gradientlayer = CAGradientLayer()
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let weatherImageView = UIImageView()
    private let temperatureLabel = UILabel()
    private let descriptionLabel = UILabel()

    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupGradient()
        configureViews()
        configureLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        gradientlayer.frame = roundedContainereView.bounds
    }
}
    
// MARK: - Public methods

extension CurrenWeatherTableViewCell {
    func set(dateTime: Double?) {
        if let dateTime = dateTime {
            let date = Date(timeIntervalSince1970: dateTime)
            let dateFormatter: DateFormatter = .init()
            
            dateFormatter.dateFormat = "dd MMMM, E"
            dateFormatter.locale = Locale(identifier: "ru_RU")
            
            let dateString = dateFormatter.string(from: date)
            
            titleLabel.text = "Сегодня, " + dateString
        } else {
            titleLabel.text = ""
        }
    }
    
    func set(temperature: Double?) {
        if let temperature = temperature {
            temperatureLabel.text = String(Int(temperature)) + "°"
        } else {
            temperatureLabel.text = "--"
        }
    }
    
    func set(feelsLike: Double?, main: Main?) {
        if
            let feelsLike = feelsLike,
            let main = main
        {
            let weatherConditions = main.weatherConditions.capitalized
            
            descriptionLabel.text = weatherConditions + ", ощущается как " + String(Int(feelsLike)) + "°"
        } else {
            temperatureLabel.text = ""
        }
    }
    
    func set(main: Main?) {
        if let main = main {
            weatherImageView.image = main.largeImage
        } else {
            
        }
    }
}

// MARK: - Private methods
    
extension CurrenWeatherTableViewCell {
    private func configureViews() {
        backgroundColor = Asset.Colors.Common.white.color
        
        roundedContainereView.clipsToBounds = true
        roundedContainereView.layer.cornerRadius = 24
        roundedContainereView.translatesAutoresizingMaskIntoConstraints = false

        gradientView.translatesAutoresizingMaskIntoConstraints = false
                
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.text = "--"
        titleLabel.textAlignment = .center
        titleLabel.textColor = Asset.Colors.Common.white.color
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)

        temperatureLabel.text = "--"
        temperatureLabel.textAlignment = .center
        temperatureLabel.textColor = Asset.Colors.Common.white.color
        temperatureLabel.font = UIFont.systemFont(ofSize: 48, weight: .medium)
            
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = Asset.Colors.Common.white.color
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    private func configureLayouts() {
        addSubview(roundedContainereView)
    
        roundedContainereView.addSubview(gradientView)
        roundedContainereView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(weatherImageView)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(descriptionLabel)
            
        NSLayoutConstraint.activate([
            roundedContainereView.topAnchor.constraint(equalTo: topAnchor),
            roundedContainereView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            roundedContainereView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            roundedContainereView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            gradientView.topAnchor.constraint(equalTo: roundedContainereView.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: roundedContainereView.bottomAnchor),
            gradientView.leftAnchor.constraint(equalTo: roundedContainereView.leftAnchor),
            gradientView.rightAnchor.constraint(equalTo: roundedContainereView.rightAnchor),
            
            stackView.topAnchor.constraint(equalTo: roundedContainereView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: roundedContainereView.bottomAnchor, constant: -24),
            stackView.leftAnchor.constraint(equalTo: roundedContainereView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: roundedContainereView.rightAnchor)
        ])
    }
    
    private func setupGradient() {
        gradientView.layer.addSublayer(gradientlayer)
        gradientlayer.colors = [
            Asset.Colors.CurrenWeather.Gradients.Day.Main.top.color.cgColor,
            Asset.Colors.CurrenWeather.Gradients.Day.Main.bottom.color.cgColor
        ]
    }
}
