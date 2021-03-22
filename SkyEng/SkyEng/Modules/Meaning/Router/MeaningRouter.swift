//
//  MeaningRouter.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 22/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Swinject

class MeaningRouter: MeaningRouterProtocol {

	weak var view: UIViewController?

	private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }
}
