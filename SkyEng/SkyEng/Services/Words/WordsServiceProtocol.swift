//
//  WordsServiceProtocol.swift
//  SkyEng
//
//  Created Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

protocol WordsServiceProtocol {
    func getSearch<T: Decodable>(text: String, page: Int, pageSize: Int, success: @escaping ([T]) -> Void, failure: ((Error) -> Void)?)
}

extension WordsServiceProtocol {
    func getSearch<T: Decodable>(text: String = "", page: Int = 0, pageSize: Int = 15, success: @escaping ([T]) -> Void, failure: ((Error) -> Void)?) {
        getSearch(text: text, page: page, pageSize: pageSize, success: success, failure: failure)
    }
}
