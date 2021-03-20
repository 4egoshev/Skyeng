//
//  Logger.swift
//  NetworkSDK
//
//  Created by Александр Чегошев on 20.03.2021.
//

import Alamofire

final class Logger: EventMonitor {
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        #if DEBUG
            print("---> response: \(response.debugDescription)", separator: "\n")
        #endif
    }
}
