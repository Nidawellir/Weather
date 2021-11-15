//
//  GeneralDayView.swift
//  WeatherApp
//
//  Created by Алексей on 10.11.2021.
//

import UIKit

final class GeneralDayView: UIView {
    
    // MARK: - Private properties
    
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
    
// MARK: - Private methods
    
extension GeneralDayView {
    private func configureViews() {
        backgroundColor = Asset.Colors.Common.white.color
        
        tableView.backgroundColor = Asset.Colors.Common.white.color
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 180
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
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: currenWeatherTableViewCellIdentifier, for: indexPath)
        case 1:
            return tableView.dequeueReusableCell(withIdentifier: dailyWeatherTableViewCellIdentifier, for: indexPath) as! DailyWeatherTableViewCell
        default:
            return .init()
        }
    }
}
