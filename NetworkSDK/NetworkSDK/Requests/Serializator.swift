//
//  Serializator.swift
//  NetworkSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Alamofire

struct Serializator<T: Encodable> {
    
    static func serialile(object: T) -> Parameters? {
        let encoder = JSONEncoder()
        guard
            let encoded = try? encoder.encode(object),
            let json = try? JSONSerialization.jsonObject(with: encoded, options: .allowFragments) as? [String: Any]
        else { return nil }
        return json
    }
}
