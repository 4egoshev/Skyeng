//
//  WordsServiceProtocol.swift
//  SkyEng
//
//  Created Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

protocol WordsServiceProtocol {
    func getModel<T: Decodable>(search: String, page: Int, pageSize: Int, success: @escaping (T) -> Void, failure: ((Error) -> Void)?)
}

extension WordsServiceProtocol {
    func getModel<T: Decodable>(search: String = "", page: Int = 0, pageSize: Int = 15, success: @escaping (T) -> Void, failure: ((Error) -> Void)?) {
        getModel(search: search, page: page, pageSize: pageSize, success: success, failure: failure)
    }
}
