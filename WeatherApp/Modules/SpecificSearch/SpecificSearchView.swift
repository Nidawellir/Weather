//
//  SpecificSearchView.swift
//  WeatherApp
//
//  Created by Алексей on 24.11.2021.
//

import UIKit

protocol SpecificSearchViewDelegate: AnyObject {
    func didChange(searchText: String)
    func didTapCancelButton()
    func didTapConfirmButton(with city: City)
}

final class SpecificSearchView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let roundedViewCornerRadius: CGFloat = 24.0
        static let buttonsStackViewSpacing: CGFloat = 8.0
        static let buttonsCornerRadius: CGFloat = 12.0
        static let spacingAfterSearchBar: CGFloat = 12.0
        static let spacingCollectionView: CGFloat = 32.0
        static let roundedViewHorizontalPadding: CGFloat = 16.0
        static let containerStackViewPadding: CGFloat = 16.0
        static let buttonsHeight: CGFloat = 40.0
        static let collectionViewHeight: CGFloat = 24.0
        static let collectionViewCellHorizontalPadding: CGFloat = 8.0
    }
    
    // MARK: - Public properties
    
    weak var delegate: SpecificSearchViewDelegate?
    
    // MARK: - Private properties
    
    private var cities: [City] = []
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
        checkIsEnabledConfirmButton()
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
    
    func set(cities: [City]) {
        self.cities = cities
        
        checkIsEnabledConfirmButton()
        
        collectionView.reloadData()
    }
}

// MARK: - Private methods
    
extension SpecificSearchView {
    private func configureViews() {
        containerView.alpha = 0
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.backgroundColor = Asset.Colors.Common.black.color
        backgroundView.alpha = 0.9
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        roundedView.backgroundColor = Asset.Colors.Common.white.color
        roundedView.layer.cornerRadius = Constants.roundedViewCornerRadius
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.backgroundColor = Asset.Colors.Common.white.color
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CityNameCollectionViewCell.self, forCellWithReuseIdentifier: nameСitiesCollectionViewCellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        containerStackView.axis = .vertical
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonsStackView.spacing = Constants.buttonsStackViewSpacing
        buttonsStackView.distribution = .fillEqually
        
        searchBar.backgroundImage = UIImage()
        searchBar.autocapitalizationType = .none
        searchBar.autocorrectionType = .no
        searchBar.delegate = self

        cancelButton.setTitle(Localizations.Common.cancel, for: .normal)
        cancelButton.layer.cornerRadius = Constants.buttonsCornerRadius
        cancelButton.backgroundColor = Asset.Colors.Search.buttonCollor.color
        cancelButton.setTitleColor(Asset.Colors.Common.black.color, for: .normal)
        cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        
        confirmButton.setTitle(Localizations.Common.confirm, for: .normal)
        confirmButton.layer.cornerRadius = Constants.buttonsCornerRadius
        confirmButton.backgroundColor = Asset.Colors.Common.blue.color
        confirmButton.setTitleColor(Asset.Colors.Common.white.color, for: .normal)
        confirmButton.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
    }

    private func configureLayouts() {
        addSubview(containerView)
        
        containerView.addSubview(backgroundView)
        
        containerView.addSubview(roundedView)
        
        roundedView.addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(searchBar)
        containerStackView.setCustomSpacing(Constants.spacingAfterSearchBar, after: searchBar)
        
        containerStackView.addArrangedSubview(collectionView)
        containerStackView.setCustomSpacing(Constants.spacingCollectionView, after: collectionView)
        
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
            roundedView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.roundedViewHorizontalPadding),
            roundedView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.roundedViewHorizontalPadding),
            
            containerStackView.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: Constants.containerStackViewPadding),
            containerStackView.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -Constants.containerStackViewPadding),
            containerStackView.leftAnchor.constraint(equalTo: roundedView.leftAnchor, constant: Constants.containerStackViewPadding),
            containerStackView.rightAnchor.constraint(equalTo: roundedView.rightAnchor, constant: -Constants.containerStackViewPadding),
            
            collectionView.heightAnchor.constraint(equalToConstant: Constants.collectionViewHeight),
            
            cancelButton.heightAnchor.constraint(equalToConstant: Constants.buttonsHeight),
            
            confirmButton.heightAnchor.constraint(equalToConstant: Constants.buttonsHeight)
        ])
    }
    
    private func checkIsEnabledConfirmButton() {
        let firstCities = cities.first
                
        confirmButton.isEnabled = searchBar.text?.count == firstCities?.name.count
        confirmButton.alpha = searchBar.text?.count == firstCities?.name.count ? 1 : 0.8
    }
    
    @objc func didTapCancelButton() {
        UIView.animate(withDuration: 0.33, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.containerView.alpha = 0
        }, completion: { [weak self] _ in
            self?.delegate?.didTapCancelButton()
        })
    }

    @objc func didTapConfirmButton() {
        guard let city = cities.first else { return }
        
        UIView.animate(withDuration: 0.33, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.containerView.alpha = 0
        }, completion: { [weak self] _ in
            self?.delegate?.didTapConfirmButton(with: city)
        })
    }
}

// MARK: - UICollectionViewDataSource

extension SpecificSearchView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nameСitiesCollectionViewCellIdentifier, for: indexPath) as! CityNameCollectionViewCell
        
        cell.set(cityName: cities[indexPath.row].name)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SpecificSearchView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = cities[indexPath.row].name
        
        searchBar.text = name
        
        delegate?.didChange(searchText: name)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (cities[indexPath.row].name as NSString).size(withAttributes: [.font: UIFont.systemFont(ofSize: 14, weight: .medium)]).width + 2 * Constants.collectionViewCellHorizontalPadding
        let height: CGFloat = Constants.collectionViewHeight
        
        return CGSize(width: width, height: height)
    }
}

// MARK: - UISearchBarDelegate

extension SpecificSearchView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.didChange(searchText: searchText)
    }
}
