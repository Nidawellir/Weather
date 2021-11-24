//
//  DaileWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Алексей on 15.11.2021.
//

import UIKit

final class DailyWeatherTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let collectionViewVerticalInset: CGFloat = 0.0
        static let collectionViewHorizontalInset: CGFloat = 20.0
        static let collectionViewMinimumLineSpacing: CGFloat = 6.0
        static let collectionViewMinimumInteritemSpacing: CGFloat = 0
        static let roundedContainerViewCornerRadius: CGFloat = 16.0
        static let roundedContainerViewVerticalPadding: CGFloat = 4.0
        static let roundedContainerViewHorizontalPadding: CGFloat = 4.0
        static let dateLabelTopPadding: CGFloat = 16.0
        static let dateLabelLeftPadding: CGFloat = 20.0
        static let weatherImageViewRightPadding: CGFloat = 20.0
        static let maxTemperatureLabelRightPadding: CGFloat = 16.0
        static let minTemperatureLabelLeftPadding: CGFloat = 16.0
        static let delimiterViewTopPadding: CGFloat = 16.0
        static let delimiterViewHorizontalPadding: CGFloat = 20.0
        static let delimiterViewHeight: CGFloat = 1.0
        static let collectionViewVerticalSpacing: CGFloat = 16.0
        static let collectionViewWidth: CGFloat = 73.0
        static let collectionViewHeight: CGFloat = 114.0
    }
    
    // MARK: - Private properties
    
    private var hourly: [Hourly] = []
    private let hourlyWeatherCollectionViewCellIdentifier = "hourlyWeatherCollectionViewCellIdentifier"
    
    // MARK: - Views properties
    
    private let roundedContainerView = UIView()
    private let dateLabel = UILabel()
    private let minTemperatureLabel = UILabel()
    private let maxTemperatureLabel = UILabel()
    private let weatherImageView = UIImageView()
    private let delimiterView = UIView()
    private let collectionViewFlowLayout: UICollectionViewFlowLayout
    private let collectionView: UICollectionView
    
    private var delimiterViewTopConstraint: NSLayoutConstraint?
    private var collectionViewTopConstraint: NSLayoutConstraint?
    private var collectionViewHeightConstraint: NSLayoutConstraint?
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let collectionViewFlowLayout: UICollectionViewFlowLayout = .init()

        self.collectionViewFlowLayout = collectionViewFlowLayout
        self.collectionView = .init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureViews()
        configureLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

 //MARK: - Public methods

extension DailyWeatherTableViewCell {
    func set(dateTime: Double?) {
        if let dateTime = dateTime {
            let date = Date(timeIntervalSince1970: dateTime)
            let dateFormatter: DateFormatter = .init()
            
            dateFormatter.dateFormat = "dd MMMM,"
            dateFormatter.locale = Locale(identifier: "ru_RU")
            
            let dateString = dateFormatter.string(from: date)
            
            dateFormatter.dateFormat = " E"
            
            let dayString = dateFormatter.string(from: date)
            
            let attributedString = NSMutableAttributedString()
            
            attributedString.append(NSAttributedString(string: dateString, attributes: [.foregroundColor: Asset.Colors.Common.black.color]))
            attributedString.append(NSAttributedString(string: dayString, attributes: [.foregroundColor: Asset.Colors.DailyWeather.titleColor.color]))
            
            dateLabel.attributedText = attributedString
        } else {
            dateLabel.text = Localizations.Common.empty
        }
    }
    
    func set(temp: Temp?) {
        if let temp = temp {
            maxTemperatureLabel.text = String(Int(temp.max)) + Localizations.Common.celsius
            minTemperatureLabel.text = String(Int(temp.min)) + Localizations.Common.celsius
        } else {
            maxTemperatureLabel.text = Localizations.Common.empty
            minTemperatureLabel.text = Localizations.Common.empty
        }
    }
    
    func set(main: Main?) {
        if let main = main {
            weatherImageView.image = main.smallImage
        } else {
            weatherImageView.image = nil
        }
    }
    
    func set(hourly: [Hourly]) {
        self.hourly = hourly
        
        collectionView.reloadData()
        
        delimiterViewTopConstraint?.constant = hourly.isEmpty ? 0 : Constants.delimiterViewTopPadding
        collectionViewTopConstraint?.constant = hourly.isEmpty ? 0 : Constants.collectionViewVerticalSpacing
        collectionViewHeightConstraint?.constant = hourly.isEmpty ? 0 : Constants.collectionViewHeight
        
        delimiterView.isHidden = hourly.isEmpty
    }
}

// MARK: - Private methods

extension DailyWeatherTableViewCell {
    private func configureViews() {
        selectionStyle = .none
        
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(
            top: Constants.collectionViewVerticalInset,
            left: Constants.collectionViewHorizontalInset,
            bottom: Constants.collectionViewVerticalInset,
            right: Constants.collectionViewHorizontalInset
        )
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = Constants.collectionViewMinimumLineSpacing
        collectionViewFlowLayout.minimumInteritemSpacing = Constants.collectionViewMinimumInteritemSpacing
        
        roundedContainerView.backgroundColor = Asset.Colors.DailyWeather.roundedContainerViewBackground.color
        roundedContainerView.layer.cornerRadius = Constants.roundedContainerViewCornerRadius
        roundedContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        minTemperatureLabel.textColor = Asset.Colors.Common.black.color
        minTemperatureLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        minTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        maxTemperatureLabel.textColor = Asset.Colors.DailyWeather.titleColor.color
        maxTemperatureLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        maxTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
            
        delimiterView.backgroundColor = Asset.Colors.DailyWeather.delimiterViewBackground.color
        delimiterView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.backgroundColor = Asset.Colors.DailyWeather.roundedContainerViewBackground.color
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HourlyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: hourlyWeatherCollectionViewCellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        contentView.addSubview(roundedContainerView)
        
        roundedContainerView.addSubview(dateLabel)
        roundedContainerView.addSubview(minTemperatureLabel)
        roundedContainerView.addSubview(maxTemperatureLabel)
        roundedContainerView.addSubview(weatherImageView)
        roundedContainerView.addSubview(delimiterView)
        roundedContainerView.addSubview(collectionView)
        
        delimiterViewTopConstraint = delimiterView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Constants.delimiterViewTopPadding)
        delimiterViewTopConstraint?.isActive = true
        
        collectionViewTopConstraint = collectionView.topAnchor.constraint(equalTo: delimiterView.bottomAnchor, constant: Constants.collectionViewVerticalSpacing)
        collectionViewTopConstraint?.isActive = true
        
        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: Constants.collectionViewHeight)
        collectionViewHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            roundedContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.roundedContainerViewVerticalPadding),
            roundedContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.roundedContainerViewHorizontalPadding),
            roundedContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.roundedContainerViewHorizontalPadding),
            roundedContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.roundedContainerViewVerticalPadding),
            
            dateLabel.topAnchor.constraint(equalTo: roundedContainerView.topAnchor, constant: Constants.dateLabelTopPadding),
            dateLabel.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor, constant: Constants.dateLabelLeftPadding),
            
            weatherImageView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor, constant: -Constants.weatherImageViewRightPadding),
            weatherImageView.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),

            maxTemperatureLabel.rightAnchor.constraint(equalTo: weatherImageView.leftAnchor, constant: -Constants.maxTemperatureLabelRightPadding),
            maxTemperatureLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            
            minTemperatureLabel.rightAnchor.constraint(equalTo: maxTemperatureLabel.leftAnchor, constant: -Constants.minTemperatureLabelLeftPadding),
            minTemperatureLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            
            delimiterView.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor, constant: Constants.delimiterViewHorizontalPadding),
            delimiterView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor, constant: -Constants.delimiterViewHorizontalPadding),
            delimiterView.heightAnchor.constraint(equalToConstant: Constants.delimiterViewHeight),

            collectionView.bottomAnchor.constraint(equalTo: roundedContainerView.bottomAnchor, constant: -Constants.collectionViewVerticalSpacing),
            collectionView.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor),
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension DailyWeatherTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourly.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hourlyWeatherCollectionViewCellIdentifier, for: indexPath) as! HourlyWeatherCollectionViewCell
        
        cell.set(dateTime: hourly[indexPath.row].dateTime)
        cell.set(temperature: hourly[indexPath.row].temperature)
        cell.set(main: hourly[indexPath.row].weather.first?.main)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension DailyWeatherTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.collectionViewWidth, height: Constants.collectionViewHeight)
    }
}
