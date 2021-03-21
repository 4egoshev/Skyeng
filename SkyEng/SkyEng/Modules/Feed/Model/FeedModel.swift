//
//  FeedModel.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

class FeedModel: FeedModelProtocol {

    var words: [Word] = []

    let wordsService: WordsServiceProtocol

    init(wordsService: WordsServiceProtocol) {
        self.wordsService = wordsService
    }

    func getSearch(text: String, page: Int, pageSize: Int) {
        wordsService.getSearch(text: text, page: page, pageSize: pageSize) { [weak self] (object: [Word]) in
            self?.words = object
        } failure: { [weak self] (error) in
            print(error)
        }
    }
}
