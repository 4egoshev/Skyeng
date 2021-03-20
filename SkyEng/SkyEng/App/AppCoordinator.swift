//
//  AppCoordinator.swift
//  SkyEng
//
//  Created by Александр Чегошев on 20.03.2021.
//

import Swinject

protocol AppCoordinatorProtocol {
    func start(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
}

class AppCoordinator: AppCoordinatorProtocol {
    
    private let assembler: Assembler
    
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        self.assembler = Assembler(container: Container())
    }
    
    func start(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        assembler.registerAssemblies()
        let controller = ViewController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
