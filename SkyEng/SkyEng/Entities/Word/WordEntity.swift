//
//  WordEntity.swift
//  SkyEng
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

struct WordEntity: Decodable {
    var id: Int
    var text: String
    var meanings: [MeaningEntity]
}
