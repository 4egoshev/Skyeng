//
//  MeaningViewModel.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 22/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

class MeaningViewModel: MeaningViewModelProtocol {

	let model: MeaningModelProtocol

    private let router: MeaningRouterProtocol

	init(model: MeaningModelProtocol,
		 router: MeaningRouterProtocol) {
		self.model = model
		self.router = router
	}

    func viewDidLoad() {

    }
}
