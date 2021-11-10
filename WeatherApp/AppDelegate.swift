//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Алексей on 10.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let generalDayViewController = GeneralDayViewController()
        
        self.window = window
        self.window?.rootViewController = generalDayViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}


