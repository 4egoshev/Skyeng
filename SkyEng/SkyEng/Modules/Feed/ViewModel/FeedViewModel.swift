//
//  FeedViewModel.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit
import UIComponentsSDK

class FeedViewModel: FeedViewModelProtocol {

    var headers: [TableReusableViewModelConfigurable] = []

    var dataSource: [[TableViewCellViewModelConfigurable]] = []

	let model: FeedModelProtocol

    private let router: FeedRouterProtocol

	init(model: FeedModelProtocol,
		 router: FeedRouterProtocol) {
		self.model = model
		self.router = router
	}

    func viewDidLoad() {
        model.getSearch(text: "test", page: 0, pageSize: 15)
        setupDataSource()
    }
}

private extension FeedViewModel {
    func setupDataSource() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.headers = self.model.words.map {
                self.dataSource.append([FeedWordTableViewCellViewModel()])

                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.regular(size: 16),
                    .foregroundColor: UIColor.black
                ]
                let text = $0.text + " " + "(\($0.meanings.count))"
                let ratingAttributedText = NSMutableAttributedString(string: text, attributes: attributes)

                let range = NSString(string: $0.text).range(of: "test", options: .caseInsensitive)
                ratingAttributedText.addAttribute(.font,
                                                  value: UIFont.bold(size: 18),
                                                  range: range)

                return FeedWordTableReusableViewModel(text: ratingAttributedText)
            }
        }
    }
}
