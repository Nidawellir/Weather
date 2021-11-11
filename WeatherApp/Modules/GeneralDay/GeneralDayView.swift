//
//  GeneralDayView.swift
//  WeatherApp
//
//  Created by Алексей on 10.11.2021.
//

import UIKit

final class GeneralDayView: UIView {
    
    // MARK: - Views properties
    
    private let blueView = UIView()
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let temperatureLabel = UILabel()
    private let descriptionLabel = UILabel()
    
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
        backgroundColor = .white
        
        blueView.backgroundColor = .blue
        blueView.layer.cornerRadius = 24
        blueView.translatesAutoresizingMaskIntoConstraints = false

        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.text = "Сегодня, 12 августа, чт"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            
        imageView.image = UIImage(named: "Sun")
            
        temperatureLabel.text = "30°"
        temperatureLabel.textAlignment = .center
        temperatureLabel.textColor = .white
        temperatureLabel.font = UIFont.systemFont(ofSize: 48, weight: .medium)
            
        descriptionLabel.text = "Ясно, ощущается как 32°"
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    private func configureLayouts() {
        addSubview(blueView)
    
        blueView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(descriptionLabel)
            
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            blueView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            blueView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor, constant: -24),
            stackView.leftAnchor.constraint(equalTo: blueView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: blueView.rightAnchor)
        ])
    }
}
