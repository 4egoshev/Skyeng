//
//  FeedViewModelProtocol.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIComponentsSDK

protocol FeedViewModelProtocol {

    var headers: [TableReusableViewModelConfigurable] { get set }

    var dataSource: [[TableViewCellViewModelConfigurable]] { get set }

	var model: FeedModelProtocol { get }

	func viewDidLoad()
}
