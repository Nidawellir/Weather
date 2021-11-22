//
//  GeneralDayView.swift
//  WeatherApp
//
//  Created by Алексей on 10.11.2021.
//

import UIKit

final class GeneralDayView: UIView {
    
    // MARK: - Private properties
    
    private var daylyWeather: DaylyWeather?
    private let currenWeatherTableViewCellIdentifier = "currenWeatherTableViewCellIdentifier"
    private let dailyWeatherTableViewCellIdentifier = "dailyWeatherTableViewCellIdentifier"
    
    // MARK: - Views properties
    
    private let tableView = UITableView()
   
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
    
extension GeneralDayView {
    func set(daylyWeather: DaylyWeather) {
        self.daylyWeather = daylyWeather
        
        tableView.reloadData()
    }
}

// MARK: - Private methods
    
extension GeneralDayView {
    private func configureViews() {
        backgroundColor = Asset.Colors.Common.white.color
        
        tableView.backgroundColor = Asset.Colors.Common.white.color
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 180
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CurrenWeatherTableViewCell.self, forCellReuseIdentifier: currenWeatherTableViewCellIdentifier)
        tableView.register(DailyWeatherTableViewCell.self, forCellReuseIdentifier: dailyWeatherTableViewCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension GeneralDayView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return daylyWeather?.daily.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: currenWeatherTableViewCellIdentifier, for: indexPath) as! CurrenWeatherTableViewCell
            
            cell.set(dateTime: daylyWeather?.current.dateTime)
            cell.set(feelsLike: daylyWeather?.current.feelsLike, main: daylyWeather?.current.weather.first?.main)
            cell.set(temperature: daylyWeather?.current.temperature)
            cell.set(main: daylyWeather?.current.weather.first?.main)
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: dailyWeatherTableViewCellIdentifier, for: indexPath) as! DailyWeatherTableViewCell
                        
            cell.set(dateTime: daylyWeather?.daily[indexPath.row].dateTime)
            cell.set(temp: daylyWeather?.daily[indexPath.row].temperature)
            cell.set(main: daylyWeather?.daily[indexPath.row].weather.first?.main)
            cell.set(hourly: daylyWeather?.hourly.filter { hourly in
                guard let daylyWeather = daylyWeather else { return false }
                
                let calendar = Calendar.current
                let currentDate = Date(timeIntervalSince1970: daylyWeather.daily[indexPath.row].dateTime)
                let checkDate = Date(timeIntervalSince1970: hourly.dateTime)
                
                return calendar.isDate(checkDate, inSameDayAs: currentDate)
            } ?? [])
            
            return cell
        default:
            return .init()
        }
    }
}
