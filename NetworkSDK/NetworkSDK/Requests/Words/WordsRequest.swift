//
//  WordsRequest.swift
//  NetworkSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Alamofire

public enum WordsRequest: URLRequestConvertible {

    private var basePath: String {
        return "https://dictionary.skyeng.ru/api/public"
    }
    
    case getSerch(parameters: SearhParameters)
    
    private var methodPath: String {
        switch self {
        case .getSerch:
            return "/v1/words/search"
        }
    }
    
    private var mathod: HTTPMethod {
        switch self {
        case .getSerch:
            return .get
        }
    }
    
    private var encoding: ParameterEncoding {
        switch self {
        case .getSerch:
            return URLEncoding.queryString
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .getSerch(let parameters):
            return Serializator<SearhParameters>.serialile(object: parameters)
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try basePath.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(methodPath))
        urlRequest.httpMethod = mathod.rawValue
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        urlRequest.timeoutInterval = 60
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return try encoding.encode(urlRequest, with: parameters)
    }
}
