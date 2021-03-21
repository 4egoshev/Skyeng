//
//  FeedWord.swift
//  SkyEng
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

struct FeedWord {
    var id: Int
    var text: String
    var meanings: [MeaningEntity]
    var isOpened: Bool

    init(entity: WordEntity) {
        self.id = entity.id
        self.text = entity.text
        self.meanings = entity.meanings
        self.isOpened = false
    }
}
