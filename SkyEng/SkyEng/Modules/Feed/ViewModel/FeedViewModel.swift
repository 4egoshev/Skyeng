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

    var loading: Signal<Bool, Never>
    private let loadingObserver: Signal<Bool, Never>.Observer

    var searchtext: String = "" {
        didSet {
            getSearch(text: searchtext)
        }
    }

    var headers: [TableReusableViewModelConfigurable] = []

    var dataSource: [[TableViewCellViewModelConfigurable]] = []

	let model: FeedModelProtocol

    private var openedSections: [Bool] = []
    private var indexPaths: [IndexPath]?

    private var isLastPage = false
    private var isLoading = false
    private var pageSize = 40

    private let router: FeedRouterProtocol

	init(model: FeedModelProtocol,
		 router: FeedRouterProtocol) {
		self.model = model
		self.router = router

        (reloadData, reloadDataObserver) = Signal.pipe()
        (insertRows, insertRowsObserver) = Signal.pipe()
        (deleteRows, deleteRowsObserver) = Signal.pipe()
        (loading, loadingObserver) = Signal.pipe()
	}

    func viewDidLoad() {
        bind()
        getSearch()
    }

    func willDisplayHeader(at section: Int) {
        guard !isLastPage, !isLoading, section > headers.count - pageSize / 2 else { return }
        isLoading = true
        loadingObserver.send(value: true)
        getSearch(text: searchtext, page: headers.count / pageSize)
    }
}

// MARK: Bind
private extension FeedViewModel {
    func bind() {
        model.words
            .signal
            .observeValues { [weak self] words in
                guard let self = self else { return }

                self.isLoading = false
                self.loadingObserver.send(value: false)
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

        model.pageSize
            .signal
            .observeValues { [weak self] size in
                guard let self = self else { return }
                self.isLastPage = size == 0 || size % self.pageSize != 0
            }

        model.error
            .signal
            .observeValues { [weak self] error in
                guard let self = self else { return }
                self.router.showError(error)
            }

        loading
            .signal
            .observeValues { [weak self] isLoading in
                guard let self = self else { return }
                self.isLoading = isLoading
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
                let veiwModels = word.meanings.map { meaning -> TableViewCellViewModelConfigurable in
                    let transcription = "[" + meaning.transcription + "]"
                    var viewModel = FeedWordTableViewCellViewModel(
                        translation: meaning.translation.text,
                        transcription: transcription,
                        imageUrl: meaning.imageUrl
                    )
                    viewModel.didTap = { [weak self] in
                        print("didTap")
                    }
                    viewModel.didTapPlay = { [weak self] in
                        print("didTapPlay")
                    }

                    return viewModel
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

            let range = NSString(string: word.text).range(of: searchtext, options: .caseInsensitive)
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

// MARK: Request
private extension FeedViewModel {
    func getSearch(text: String = "", page: Int = 0, pageSize: Int = 40) {
        model.getSearch(text: text, page: page, pageSize: pageSize)
    }
}
