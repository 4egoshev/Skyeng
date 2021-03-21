//
//  FeedModel.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

class FeedModel: FeedModelProtocol {

    let wordsService: WordsServiceProtocol

    init(wordsService: WordsServiceProtocol) {
        self.wordsService = wordsService
    }
}
