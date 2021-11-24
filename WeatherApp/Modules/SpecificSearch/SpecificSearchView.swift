//
//  SpecificSearchView.swift
//  WeatherApp
//
//  Created by Алексей on 24.11.2021.
//

import UIKit

protocol SpecificSearchViewDelegate: AnyObject {
    func didTapCancelButton()
    func didTapConfirmButton()
}

final class SpecificSearchView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: SpecificSearchViewDelegate?
    
    // MARK: - Private properties
    
    private let nameСitiesCollectionViewCellIdentifier = "nameСitiesCollectionViewcellIdentifier"
    
    // MARK: - Views properties
    
    private let containerView = UIView()
    private let backgroundView = UIView()
    private let roundedView = UIView()
    private let containerStackView = UIStackView()
    private let buttonsStackView = UIStackView()
    private let searchBar = UISearchBar()
    private let cancelButton = UIButton()
    private let confirmButton = UIButton()
    private let collectionView: UICollectionView
    private let collectionViewFlowLayout: UICollectionViewFlowLayout
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension SpecificSearchView {
    func show() {
        UIView.animate(withDuration: 0.33, delay: 0, options: .curveEaseInOut) { [weak self] in
            self?.containerView.alpha = 1
        }
    }
}

// MARK: - Private methods
    
extension SpecificSearchView {
    private func configureViews() {
        containerView.alpha = 0
        containerView.isUserInteractionEnabled = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.backgroundColor = Asset.Colors.Common.black.color
        backgroundView.alpha = 0.9
        backgroundView.isUserInteractionEnabled = true
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        roundedView.backgroundColor = Asset.Colors.Common.white.color
        roundedView.layer.cornerRadius = 24
        roundedView.isUserInteractionEnabled = true
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.backgroundColor = Asset.Colors.Common.white.color
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(NameСitiesCollectionViewCell.self, forCellWithReuseIdentifier: nameСitiesCollectionViewCellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        containerStackView.axis = .vertical
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonsStackView.spacing = 9
        buttonsStackView.distribution = .fillEqually
        
        searchBar.layer.cornerRadius = 12

        cancelButton.setTitle("Отменить", for: .normal)
        cancelButton.layer.cornerRadius = 12
        cancelButton.backgroundColor = Asset.Colors.Search.buttonCollor.color
        cancelButton.setTitleColor(Asset.Colors.Common.black.color, for: .normal)
        cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        
        confirmButton.setTitle("Подтвердить", for: .normal)
        confirmButton.layer.cornerRadius = 12
        confirmButton.backgroundColor = Asset.Colors.Search.buttonCollor.color
        confirmButton.setTitleColor(Asset.Colors.Common.black.color, for: .normal)
        confirmButton.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
    }

    private func configureLayouts() {
        addSubview(containerView)
        
        containerView.addSubview(backgroundView)
        
        containerView.addSubview(roundedView)
        
        roundedView.addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(searchBar)
        containerStackView.setCustomSpacing(12, after: searchBar)
        
        containerStackView.addArrangedSubview(collectionView)
        containerStackView.setCustomSpacing(32, after: collectionView)
        
        containerStackView.addArrangedSubview(buttonsStackView)
        
        buttonsStackView.addArrangedSubview(cancelButton)
        buttonsStackView.addArrangedSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: rightAnchor),
            
            roundedView.centerYAnchor.constraint(equalTo: centerYAnchor),
            roundedView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            roundedView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            containerStackView.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 16),
            containerStackView.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -16),
            containerStackView.leftAnchor.constraint(equalTo: roundedView.leftAnchor, constant: 16),
            containerStackView.rightAnchor.constraint(equalTo: roundedView.rightAnchor, constant: -16),
            
            collectionView.heightAnchor.constraint(equalToConstant: 24),
            
            cancelButton.heightAnchor.constraint(equalToConstant: 40),
            
            confirmButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func didTapCancelButton() {
        UIView.animate(withDuration: 0.33, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.containerView.alpha = 0
        }, completion: { [weak self] _ in
            self?.delegate?.didTapCancelButton()
        })
    }

    @objc func didTapConfirmButton() {
        delegate?.didTapConfirmButton()
    }
}

// MARK: - UICollectionViewDataSource

extension SpecificSearchView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nameСitiesCollectionViewCellIdentifier, for: indexPath) as! NameСitiesCollectionViewCell
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SpecificSearchView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 67, height: 24)
    }
}
