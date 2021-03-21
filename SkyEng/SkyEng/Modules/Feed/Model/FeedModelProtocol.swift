//
//  FeedModelProtocol.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

protocol FeedModelProtocol {

    var words: [Word] { get set }

    var wordsService: WordsServiceProtocol { get }

    func getSearch(text: String, page: Int, pageSize: Int)
}

extension FeedModelProtocol {

    func getSearch(text: String = "", page: Int = 0, pageSize: Int = 15) {
        getSearch(text: text, page: page, pageSize: pageSize)
    }
}
