//
//  FeedWordTableReusableViewModel.swift
//  UIComponentsSDK
//
//  Created Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public typealias FeedWordTableReusableViewConfigurator = TableReusableViewConfigurator<FeedWordTableReusableView, FeedWordTableReusableViewModelProtocol>

public struct FeedWordTableReusableViewModel: FeedWordTableReusableViewModelProtocol {
    
    public var text: NSMutableAttributedString
    
    public var height: CGFloat
    
    public var configurator: TableReusableViewConfigurable = FeedWordTableReusableViewConfigurator()
    
    public init(text: NSMutableAttributedString,
                height: CGFloat = 44.0) {
        self.text = text
        self.height = height
    }
}
