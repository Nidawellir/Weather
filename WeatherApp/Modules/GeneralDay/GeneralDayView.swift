//
//  GeneralDayView.swift
//  WeatherApp
//
//  Created by Алексей on 10.11.2021.
//

import UIKit

final class GeneralDayView: UIView {
    
    // MARK: - Views properties
    
    private let roundedContainereView = UIView()
    private let gradientView = UIView()
    private let gradientlayer = CAGradientLayer()
    private let intersectImageView = UIImageView(image: UIImage(named: "Intersect"))
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let temperatureLabel = UILabel()
    private let descriptionLabel = UILabel()

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
// MARK: - Private methods
    
extension GeneralDayView {
    private func configureViews() {
        backgroundColor = .white
        
        roundedContainereView.clipsToBounds = true
        roundedContainereView.layer.cornerRadius = 24
        roundedContainereView.translatesAutoresizingMaskIntoConstraints = false

        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        intersectImageView.translatesAutoresizingMaskIntoConstraints = false
        
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
        addSubview(roundedContainereView)
    
        roundedContainereView.addSubview(gradientView)
        roundedContainereView.addSubview(intersectImageView)
        roundedContainereView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(descriptionLabel)
            
        NSLayoutConstraint.activate([
            roundedContainereView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            roundedContainereView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            roundedContainereView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            gradientView.topAnchor.constraint(equalTo: roundedContainereView.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: roundedContainereView.bottomAnchor),
            gradientView.leftAnchor.constraint(equalTo: roundedContainereView.leftAnchor),
            gradientView.rightAnchor.constraint(equalTo: roundedContainereView.rightAnchor),
            
            intersectImageView.bottomAnchor.constraint(equalTo: roundedContainereView.bottomAnchor),
            intersectImageView.leftAnchor.constraint(equalTo: roundedContainereView.leftAnchor),
            intersectImageView.rightAnchor.constraint(equalTo: roundedContainereView.rightAnchor),
            
            stackView.topAnchor.constraint(equalTo: roundedContainereView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: roundedContainereView.bottomAnchor, constant: -24),
            stackView.leftAnchor.constraint(equalTo: roundedContainereView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: roundedContainereView.rightAnchor)
        ])
    }
    
    private func setupGradient() {
        guard
            let blueFirst = UIColor(named: "Colors/BlueFirst"),
            let blueSecond = UIColor(named: "Colors/BlueSecond")
        else { return }
        
        gradientView.layer.addSublayer(gradientlayer)
        gradientlayer.colors = [blueFirst.cgColor, blueSecond.cgColor]
    }
}
