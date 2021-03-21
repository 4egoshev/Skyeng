//
//  SearhParameters.swift
//  NetworkSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

public struct SearhParameters: Encodable {
    let search: String
    let page: Int
    let pageSize: Int
    
    public init(search: String, page: Int, pageSize: Int) {
        self.search = search
        self.page = page
        self.pageSize = pageSize
    }
}
