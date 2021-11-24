//
//  CurrenWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Алексей on 15.11.2021.
//

import UIKit

final class CurrenWeatherTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let roundedContainerViewCornerRadius: CGFloat = 24.0
        static let roundedContainerViewBottomPadding: CGFloat = 16.0
        static let roundedContainerViewHorizontalPadding: CGFloat = 16.0
        static let stackViewTopPadding: CGFloat = 16.0
        static let stackViewBottomPadding: CGFloat = 24.0
    }
    
    // MARK: - Views properties
    
    private let roundedContainerView = UIView()
    private let gradientView = UIView()
    private let gradientlayer = CAGradientLayer()
    private let circleGradientImageView: UIImageView = .init(image: Asset.Images.Common.circleGradient.image)
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let weatherImageView = UIImageView()
    private let temperatureLabel = UILabel()
    private let descriptionLabel = UILabel()

    private var circleGradientImageViewHeightConstraint: NSLayoutConstraint?
    
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
                
        gradientlayer.frame = roundedContainerView.bounds
        circleGradientImageViewHeightConstraint?.constant = roundedContainerView.frame.height * 0.6
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
            
            titleLabel.text = Localizations.Common.today + Localizations.Common.comma + Localizations.Common.space + dateString
        } else {
            titleLabel.text = Localizations.Common.empty
        }
    }
    
    func set(temperature: Double?) {
        if let temperature = temperature {
            temperatureLabel.text = String(Int(temperature)) + Localizations.Common.celsius
        } else {
            temperatureLabel.text = Localizations.Common.empty
        }
    }
    
    func set(feelsLike: Double?, main: Main?) {
        if
            let feelsLike = feelsLike,
            let main = main
        {
            let weatherConditions = main.weatherConditions.capitalized
            
            descriptionLabel.text = weatherConditions
                + Localizations.Common.comma
                + Localizations.Common.space
                + Localizations.CurrenWeatherTableViewCell.feelsLike
                + Localizations.Common.space
                + String(Int(feelsLike))
                + Localizations.Common.celsius
        } else {
            descriptionLabel.text = Localizations.Common.empty
        }
    }
    
    func set(main: Main?) {
        if let main = main {
            weatherImageView.image = main.largeImage
        } else {
            weatherImageView.image = Asset.Images.Weather.Large.sun.image
        }
    }
}

// MARK: - Private methods
    
extension CurrenWeatherTableViewCell {
    private func configureViews() {
        backgroundColor = Asset.Colors.Common.white.color
        
        roundedContainerView.clipsToBounds = true
        roundedContainerView.layer.cornerRadius = Constants.roundedContainerViewCornerRadius
        roundedContainerView.translatesAutoresizingMaskIntoConstraints = false

        gradientView.translatesAutoresizingMaskIntoConstraints = false
                
        circleGradientImageView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.text = Localizations.Common.empty
        titleLabel.textAlignment = .center
        titleLabel.textColor = Asset.Colors.Common.white.color
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)

        weatherImageView.image = Asset.Images.Weather.Large.sun.image
        
        temperatureLabel.text = Localizations.Common.empty
        temperatureLabel.textAlignment = .center
        temperatureLabel.textColor = Asset.Colors.Common.white.color
        temperatureLabel.font = UIFont.systemFont(ofSize: 48, weight: .medium)
            
        descriptionLabel.text = Localizations.Common.empty
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = Asset.Colors.Common.white.color
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    private func configureLayouts() {
        addSubview(roundedContainerView)
    
        roundedContainerView.addSubview(gradientView)
        roundedContainerView.addSubview(circleGradientImageView)
        roundedContainerView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(weatherImageView)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(descriptionLabel)
            
        circleGradientImageViewHeightConstraint = circleGradientImageView.heightAnchor.constraint(equalToConstant: 0.0)
        circleGradientImageViewHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            roundedContainerView.topAnchor.constraint(equalTo: topAnchor),
            roundedContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.roundedContainerViewBottomPadding),
            roundedContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.roundedContainerViewHorizontalPadding),
            roundedContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.roundedContainerViewHorizontalPadding),
            
            gradientView.topAnchor.constraint(equalTo: roundedContainerView.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: roundedContainerView.bottomAnchor),
            gradientView.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor),
            gradientView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor),
            
            circleGradientImageView.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor),
            circleGradientImageView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor),
            circleGradientImageView.bottomAnchor.constraint(equalTo: roundedContainerView.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: roundedContainerView.topAnchor, constant: Constants.stackViewTopPadding),
            stackView.bottomAnchor.constraint(equalTo: roundedContainerView.bottomAnchor, constant: -Constants.stackViewBottomPadding),
            stackView.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor)
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
