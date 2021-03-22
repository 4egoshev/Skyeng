//
//  MeaningAssembly.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 22/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Swinject

class MeaningAssembly: MeaningAssemblyProtocol {

	private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

	func make() -> MeaningViewController {
		let model = MeaningModel()
		let router = MeaningRouter(resolver: resolver)
		let viewModel = MeaningViewModel(model: model, router: router)
		let controller = MeaningViewController(viewModel: viewModel)
		router.view = controller
		return controller
	}
}
