//
//  ModuleAssembly.swift
//  SkyEng
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Swinject

class ModuleAssembly: Assembly {

    func assemble(container: Container) {
        container.register(FeedAssemblyProtocol.self) { resolver in
            return FeedAssembly(resolver: resolver)
        }
        container.register(MeaningAssemblyProtocol.self) { resolver in
            return MeaningAssembly(resolver: resolver)
        }
    }
}
