//
//  Networker.swift
//  NetworkSDK
//
//  Created by Александр Чегошев on 20.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Alamofire

public typealias Response<T> = Result<T, AFError>

public protocol NetworkerProtocol {
    func request<T: Decodable>(_ urlRequest: URLRequestConvertible,
                               completion: @escaping (Response<T>) -> Void)
    
    func cancelAll()
}

public class Networker: NetworkerProtocol {
    
    private let session: Session
    
    public init() {
        let rootQueue = DispatchQueue(label: "sdk.network")
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.underlyingQueue = rootQueue
        let delegate = SessionDelegate()
        let configuration = URLSessionConfiguration.af.default
        let urlSession = URLSession(configuration: configuration,
                                    delegate: delegate,
                                    delegateQueue: queue)
        let interceptor = Interceptor()
        let logger = Logger()
        
        session = Session(
            session: urlSession,
            delegate: delegate,
            rootQueue: rootQueue,
            startRequestsImmediately: true,
            interceptor: interceptor,
            eventMonitors: [logger]
        )
    }
    
    public func request<T: Decodable>(_ urlRequest: URLRequestConvertible,
                                      completion: @escaping (Response<T>) -> Void) {
        session.request(urlRequest).validate().responseDecodable { (response: AFDataResponse<T>) in
            completion(response.result)
        }
    }
    
    public func cancelAll() {
        session.cancelAllRequests()
    }
}
