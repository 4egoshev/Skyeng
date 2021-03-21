//
//  FeedViewModel.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit
import UIComponentsSDK
import ReactiveSwift

class FeedViewModel: FeedViewModelProtocol {

    var reloadData: Signal<(), Never>
    private var reloadDataObserver: Signal<(), Never>.Observer

    var searchtext: String? {
        didSet {
            print("searchtext = \(searchtext)")
            getSearch(text: searchtext ?? "")
        }
    }

    var headers: [TableReusableViewModelConfigurable] = []

    var dataSource: [[TableViewCellViewModelConfigurable]] = []

	let model: FeedModelProtocol

    private var openedSections: [Bool] = []

    private let router: FeedRouterProtocol

	init(model: FeedModelProtocol,
		 router: FeedRouterProtocol) {
		self.model = model
		self.router = router

        (reloadData, reloadDataObserver) = Signal.pipe()
	}

    func viewDidLoad() {
        bind()
        getSearch()
    }

    private func getSearch(text: String = "", page: Int = 0, pageSize: Int = 15) {
        model.getSearch(text: text, page: 0, pageSize: 15)
    }
}

// MARK: Bind
private extension FeedViewModel {
    func bind() {
        model.words
            .signal
            .observeValues { [weak self] words in
                self?.setupDataSource(with: words)
                self?.reloadDataObserver.send(value: ())
            }

        model.error
            .signal
            .observeValues { [weak self] error in
                print(error?.localizedDescription)
            }
    }
}

// MARK: Setup
private extension FeedViewModel {
    func setupDataSource(with words: [Word]) {
        headers.removeAll()
        dataSource.removeAll()
        headers = words.map {
//                self.dataSource.append([SpacingTableViewCellViewModel()])

            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.regular(size: 16),
                .foregroundColor: UIColor.black
            ]
            let text = $0.text + " " + "(\($0.meanings.count))"
            let ratingAttributedText = NSMutableAttributedString(string: text, attributes: attributes)

            let range = NSString(string: $0.text).range(of: searchtext ?? "", options: .caseInsensitive)
            ratingAttributedText.addAttribute(.font,
                                              value: UIFont.bold(size: 18),
                                              range: range)

            return FeedWordTableReusableViewModel(text: ratingAttributedText)
        }

        words.forEach { word in
            dataSource.append(word.meanings.map {
                return FeedWordTableViewCellViewModel(text: $0.translation.text)
            })
        }
    }
}
