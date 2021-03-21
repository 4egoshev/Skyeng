//
//  FeedAssembly.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Swinject

class FeedAssembly: FeedAssemblyProtocol {

	private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

	func make() -> FeedViewController {
        let wordsService = WordsService()
        let model = FeedModel(wordsService: wordsService)
		let router = FeedRouter(resolver: resolver)
		let viewModel = FeedViewModel(model: model, router: router)
		let controller = FeedViewController(viewModel: viewModel)
		router.view = controller
		return controller
	}
}
