//
//  WordsService.swift
//  SkyEng
//
//  Created Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import NetworkSDK

final class WordsService {

    let networker: NetworkerProtocol

    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
}

extension WordsService: WordsServiceProtocol {
    func getModel<T: Decodable>(search: String, page: Int, pageSize: Int, success: @escaping (T) -> Void, failure: ((Error) -> Void)? = nil) {
        let params = SearhParameters(search: search, page: page, pageSize: pageSize)
        let request = WordsRequest.getSerch(parameters: params)
        networker.request(request) { (response: Response<T>) in
            switch response {
            case .success(let object):
                success(object)
            case .failure(let error):
                failure?(error)
            }
        }
    }
}
