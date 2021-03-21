//
//  MeaningEntity.swift
//  SkyEng
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

struct MeaningEntity: Decodable {
    var id: Int
    var translation: TranslationEntity
    var partOfSpeechCode: String
    var previewUrl: String
    var imageUrl: String
    var soundUrl: String
    var transcription: String
}
