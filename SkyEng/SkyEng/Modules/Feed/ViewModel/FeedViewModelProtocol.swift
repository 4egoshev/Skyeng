//
//  FeedViewModelProtocol.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIComponentsSDK
import ReactiveSwift

protocol FeedViewModelProtocol {

    var reloadData: Signal<(), Never> { get }

    var insertRows: Signal<[IndexPath], Never> { get }

    var deleteRows: Signal<[IndexPath], Never> { get }

    var searchtext: String { get set }

    var headers: [TableReusableViewModelConfigurable] { get set }

    var dataSource: [[TableViewCellViewModelConfigurable]] { get set }

	var model: FeedModelProtocol { get }

	func viewDidLoad()

    func willDisplayHeader(at section: Int)
}
