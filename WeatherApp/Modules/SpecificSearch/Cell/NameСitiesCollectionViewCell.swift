//
//  NameСitiesCollectionViewCell.swift
//  WeatherApp
//
//  Created by Алексей on 23.11.2021.
//

import UIKit

final class NameСitiesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views properties
    
    private let roundedContainerView = UIView()
    private let nameСitieLabel = UILabel()
    
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

extension NameСitiesCollectionViewCell {
    private func configureViews() {
        roundedContainerView.backgroundColor = Asset.Colors.Search.buttonCollor.color
        roundedContainerView.layer.cornerRadius = 8
        roundedContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        nameСitieLabel.text = "Москва"
        nameСitieLabel.textColor = Asset.Colors.Common.black.color
        nameСitieLabel.textAlignment = .center
        nameСitieLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        nameСitieLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureLayouts() {
        contentView.addSubview(roundedContainerView)
                
        roundedContainerView.addSubview(nameСitieLabel)
        
        NSLayoutConstraint.activate([
            roundedContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            roundedContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            roundedContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            roundedContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            nameСitieLabel.topAnchor.constraint(equalTo: roundedContainerView.topAnchor),
            nameСitieLabel.bottomAnchor.constraint(equalTo: roundedContainerView.bottomAnchor),
            nameСitieLabel.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor),
            nameСitieLabel.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor),
        ])
    }
}
