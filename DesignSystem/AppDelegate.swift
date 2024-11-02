//
//  AppDelegate.swift
//  DesignSystem
//
//  Created by Fernando on 01/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let firstVC = ViewController()
        let navigationController = UINavigationController(rootViewController: firstVC)
        TokenManager.shared.loadStrategies()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

