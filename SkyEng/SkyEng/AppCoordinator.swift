//
//  AppCoordinator.swift
//  SkyEng
//
//  Created by Александр Чегошев on 20.03.2021.
//

import UIKit

protocol AppCoordinatorProtocol {
    func start(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
}

class AppCoordinator: AppCoordinatorProtocol {
    
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        let controller = ViewController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
