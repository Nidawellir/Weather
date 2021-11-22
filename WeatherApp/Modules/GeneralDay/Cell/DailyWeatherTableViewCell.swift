//
//  DaileWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Алексей on 15.11.2021.
//

import UIKit

final class DailyWeatherTableViewCell: UITableViewCell {
    
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
            
            dateFormatter.dateFormat = "E"
            
            let dayString = dateFormatter.string(from: date)
            
            let attributedString = NSMutableAttributedString()
            
            attributedString.append(NSAttributedString(string: dateString, attributes: [.foregroundColor: Asset.Colors.Common.black.color]))
            attributedString.append(NSAttributedString(string: " \(dayString)", attributes: [.foregroundColor: Asset.Colors.DailyWeather.titleColor.color]))
            
            dateLabel.attributedText = attributedString
        } else {
            dateLabel.text = ""
        }
    }
    
    func set(temp: Temp?) {
        if let temp = temp {
            maxTemperatureLabel.text = String(Int(temp.max))
            minTemperatureLabel.text = String(Int(temp.min))
        } else {
            
        }
    }
    
    func set(main: Main?) {
        if let main = main {
            weatherImageView.image = main.smallImage
        } else {
            
        }
    }
    
    func set(hourly: [Hourly]) {
        self.hourly = hourly
        
        collectionView.reloadData()
    }
}

// MARK: - Private methods

extension DailyWeatherTableViewCell {
    private func configureViews() {
        selectionStyle = .none
        
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = 6
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        
        roundedContainerView.backgroundColor = Asset.Colors.DailyWeather.roundedContainerViewBackground.color
        roundedContainerView.layer.cornerRadius = 16
        roundedContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text = "--"
        dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        minTemperatureLabel.text = "25°"
        minTemperatureLabel.textColor = Asset.Colors.Common.black.color
        minTemperatureLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        minTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        maxTemperatureLabel.text = "29°"
        maxTemperatureLabel.textColor = Asset.Colors.DailyWeather.titleColor.color
        maxTemperatureLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        maxTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        weatherImageView.image = Asset.Images.Weather.Small.sun.image
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
        
        NSLayoutConstraint.activate([
            roundedContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            roundedContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            roundedContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            roundedContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            dateLabel.topAnchor.constraint(equalTo: roundedContainerView.topAnchor, constant: 16),
            dateLabel.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor, constant: 20),
            
            weatherImageView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor, constant: -20),
            weatherImageView.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),

            maxTemperatureLabel.rightAnchor.constraint(equalTo: weatherImageView.leftAnchor, constant: -16),
            maxTemperatureLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            
            minTemperatureLabel.rightAnchor.constraint(equalTo: maxTemperatureLabel.leftAnchor, constant: -16),
            minTemperatureLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            
            delimiterView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            delimiterView.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor, constant: 20),
            delimiterView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor, constant: -20),
            delimiterView.heightAnchor.constraint(equalToConstant: 1),

            collectionView.topAnchor.constraint(equalTo: delimiterView.bottomAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: roundedContainerView.bottomAnchor, constant: -16),
            collectionView.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 114)
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
        return CGSize(width: 73, height: 114)
    }
}
