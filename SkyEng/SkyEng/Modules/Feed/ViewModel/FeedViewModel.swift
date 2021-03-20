//
//  FeedViewModel.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIComponentsSDK

class FeedViewModel: FeedViewModelProtocol {

    var dataSource: [TableViewCellViewModelConfigurable] = []

	let model: FeedModelProtocol

    private let router: FeedRouterProtocol

	init(model: FeedModelProtocol,
		 router: FeedRouterProtocol) {
		self.model = model
		self.router = router
	}

    func viewDidLoad() {

    }
}
