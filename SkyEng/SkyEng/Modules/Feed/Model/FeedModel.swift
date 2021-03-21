//
//  FeedModel.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import ReactiveSwift

class FeedModel: FeedModelProtocol {

    var words: Property<[Word]> { Property(_words) }
    private var _words: MutableProperty<[Word]> = MutableProperty([])

    var error: Property<Error?> { Property(_error) }
    private var _error: MutableProperty<Error?> = MutableProperty(nil)

    let wordsService: WordsServiceProtocol

    init(wordsService: WordsServiceProtocol) {
        self.wordsService = wordsService
    }

    func getSearch(text: String, page: Int, pageSize: Int) {
        wordsService.getSearch(text: text, page: page, pageSize: pageSize) { [weak self] (object: [Word]) in
            self?._words.value = object
        } failure: { [weak self] (error) in
            self?._error.value = error
        }
    }
}
