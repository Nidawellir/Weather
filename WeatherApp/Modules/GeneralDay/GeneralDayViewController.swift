//
//  GeneralDayViewController.swift
//  WeatherApp
//
//  Created by Алексей on 10.11.2021.
//

import UIKit

final class GeneralDayViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let generalDayView = GeneralDayView()
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        view = generalDayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Тамбов"
        
        view.backgroundColor = .white
        
        let test1Button = UIButton(frame: .init(x: -40, y: 0, width: 32, height: 32))
        test1Button.setImage(UIImage(named: "test1"), for: .normal)
        test1Button.addTarget(self, action: #selector(test1), for: .touchUpInside)
        
        let test2Button = UIButton()
        test2Button.setImage(UIImage(named: "test2"), for: .normal)
        test2Button.addTarget(self, action: #selector(test2), for: .touchUpInside)
        
        let test3Button = UIButton()
        test3Button.setImage(UIImage(named: "test3"), for: .normal)
        test3Button.addTarget(self, action: #selector(test3), for: .touchUpInside)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let test1BarButtonItem = UIBarButtonItem(customView: test1Button)
        
        navigationItem.leftBarButtonItem = test1BarButtonItem
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: test2Button), UIBarButtonItem(customView: test3Button)]
    }
    
    @objc
    private func test1() {
        print("test1")
    }
    
    @objc
    private func test2() {
        print("test2")
    }
    
    @objc
    private func test3() {
        print("test3")
    }
}
