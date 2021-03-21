//
//  FeedViewModel.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIComponentsSDK

class FeedViewModel: FeedViewModelProtocol {

    var headers: [TableReusableViewModelConfigurable] = []

    var dataSource: [TableViewCellViewModelConfigurable] = []

	let model: FeedModelProtocol

    private let router: FeedRouterProtocol

	init(model: FeedModelProtocol,
		 router: FeedRouterProtocol) {
		self.model = model
		self.router = router
	}

    func viewDidLoad() {
        model.getSearch(text: "new", page: 0, pageSize: 15)
        setupDataSource()
    }
}

private extension FeedViewModel {
    func setupDataSource() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.model.words.forEach { _ in
                self.dataSource.append(FeedWordTableViewCellViewModel())
            }
        }
    }
}
