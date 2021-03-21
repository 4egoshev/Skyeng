//
//  SpacingTableViewCellViewModel.swift
//  UIComponentsSDK
//
//  Created Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public typealias SpacingTableViewCellConfigurator = TableViewCellConfigurator<SpacingTableViewCell, SpacingTableViewCellViewModelProtocol>

public struct SpacingTableViewCellViewModel: SpacingTableViewCellViewModelProtocol {
    
    public var height: CGFloat
    
    public var configurator: TableViewCellConfigurable = SpacingTableViewCellConfigurator()
    
    public init(height: CGFloat = 1) {
        self.height = height
    }
}
