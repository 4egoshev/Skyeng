//
//  AppDelegate.swift
//  SkyEng
//
//  Created by Александр Чегошев on 20.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var coordinator: AppCoordinatorProtocol?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        coordinator = AppCoordinator(window: window)
        coordinator?.start(with: launchOptions)
        
        return true
    }
}

