//
//  FeedModel.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import ReactiveSwift

class FeedModel: FeedModelProtocol {

    var words: Property<[FeedWord]> { Property(_words) }
    private var _words: MutableProperty<[FeedWord]> = MutableProperty([])

    var pageSize: Property<Int> { Property(_pageSize) }
    private var _pageSize: MutableProperty<Int> = MutableProperty(0)

    var error: Property<Error?> { Property(_error) }
    private var _error: MutableProperty<Error?> = MutableProperty(nil)

    let wordsService: WordsServiceProtocol

    init(wordsService: WordsServiceProtocol) {
        self.wordsService = wordsService
    }

    func getSearch(text: String, page: Int, pageSize: Int) {
        wordsService.getSearch(text: text, page: page, pageSize: pageSize) { [weak self] (objects: [WordEntity]) in
            guard let self = self else { return }
            self._pageSize.value = objects.count
            let words = objects.map { FeedWord(entity: $0) }

            page == 0
                ? self._words.value = words
                : self._words.value.append(contentsOf: words)
        } failure: { [weak self] (error) in
            self?._error.value = error
        }
    }

    func openWord(at index: Int) {
        _words.value[index].isOpened.toggle()
    }
}
