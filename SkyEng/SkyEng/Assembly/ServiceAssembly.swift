//
//  ServiceAssembly.swift
//  SkyEng
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Swinject
import NetworkSDK

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        register(container: container)
    }

    func register(container: Container) {
        container.register(NetworkerProtocol.self) { _ in
            Networker()
        }.inObjectScope(.graph)
    }
}
