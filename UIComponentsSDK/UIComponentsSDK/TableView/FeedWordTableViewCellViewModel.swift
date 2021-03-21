//
//  FeedWordTableViewCellViewModel.swift
//  UIComponentsSDK
//
//  Created Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

public typealias FeedWordTableViewCellConfigurator = TableViewCellConfigurator<FeedWordTableViewCell, FeedWordTableViewCellViewModelProtocol>

public struct FeedWordTableViewCellViewModel: FeedWordTableViewCellViewModelProtocol {
    
    public var configurator: TableViewCellConfigurable = FeedWordTableViewCellConfigurator()
    
    public init() {
        
    }
}
