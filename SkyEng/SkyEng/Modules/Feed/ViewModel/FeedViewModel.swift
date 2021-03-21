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

    var insertRows: Signal<[IndexPath], Never>
    private let insertRowsObserver: Signal<[IndexPath], Never>.Observer

    var deleteRows: Signal<[IndexPath], Never>
    private let deleteRowsObserver: Signal<[IndexPath], Never>.Observer

    var searchtext: String? {
        didSet {
            getSearch(text: searchtext ?? "")
        }
    }

    var headers: [TableReusableViewModelConfigurable] = []

    var dataSource: [[TableViewCellViewModelConfigurable]] = []

	let model: FeedModelProtocol

    private var openedSections: [Bool] = []
    private var didTapOpen: Bool = false
    private var indexPaths: [IndexPath]?

    private let router: FeedRouterProtocol

	init(model: FeedModelProtocol,
		 router: FeedRouterProtocol) {
		self.model = model
		self.router = router

        (reloadData, reloadDataObserver) = Signal.pipe()
        (insertRows, insertRowsObserver) = Signal.pipe()
        (deleteRows, deleteRowsObserver) = Signal.pipe()
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
                guard let self = self else { return }
                self.setupDataSource(with: words)

                if let indexPaths = self.indexPaths, let section = indexPaths.first?.section {
                    words[section].isOpened
                        ? self.insertRowsObserver.send(value: indexPaths)
                        : self.deleteRowsObserver.send(value: indexPaths)
                } else {
                    self.reloadDataObserver.send(value: ())
                }
                self.indexPaths = nil
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
    func setupDataSource(with words: [FeedWord]) {
        headers.removeAll()
        dataSource.removeAll()
        headers = words.enumerated().map { (index, word) in
            if word.isOpened {
                let veiwModels = word.meanings.map {
                    FeedWordTableViewCellViewModel(text: $0.translation.text)
                }
                dataSource.append(veiwModels)
            } else {
                self.dataSource.append([])
            }

            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.regular(size: 16),
                .foregroundColor: UIColor.black
            ]
            let text = word.text + " " + "(\(word.meanings.count))"
            let ratingAttributedText = NSMutableAttributedString(string: text, attributes: attributes)

            let range = NSString(string: word.text).range(of: searchtext ?? "", options: .caseInsensitive)
            ratingAttributedText.addAttribute(.font,
                                              value: UIFont.bold(size: 18),
                                              range: range)

            var viewModel = FeedWordTableReusableViewModel(text: ratingAttributedText, isOpened: word.isOpened)
            viewModel.didTap = { [weak self, index, word] in
                guard let self = self else { return }
                self.indexPaths = word.meanings.enumerated().map { (i, _) in IndexPath(row: i, section: index) }
                self.model.openWord(at: index)
            }

            return viewModel
        }
    }
}
