//
//  FeedModelProtocol.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import ReactiveSwift

protocol FeedModelProtocol {

    var words: Property<[FeedWord]> { get }

    var pageSize: Property<Int> { get }

    var error: Property<Error?> { get }

    var wordsService: WordsServiceProtocol { get }

    func getSearch(text: String, page: Int, pageSize: Int)

    func openWord(at index: Int)
}

extension FeedModelProtocol {

    func getSearch(text: String = "", page: Int = 0, pageSize: Int = 15) {
        getSearch(text: text, page: page, pageSize: pageSize)
    }
}
