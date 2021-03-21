//
//  Meaning.swift
//  SkyEng
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

struct Meaning: Decodable {
    var id: Int
    var translation: Translation
    var partOfSpeechCode: String
    var previewUrl: String
    var imageUrl: String
    var soundUrl: String
    var transcription: String
}
