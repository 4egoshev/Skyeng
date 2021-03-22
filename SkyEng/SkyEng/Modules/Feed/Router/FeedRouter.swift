//
//  FeedRouter.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Swinject

class FeedRouter: FeedRouterProtocol {

	weak var view: UIViewController?

	private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func showMeaning() {
        guard let controller = resolver.resolve(MeaningAssemblyProtocol.self)?.make() else { return }
        push(controller: controller)
    }
}
