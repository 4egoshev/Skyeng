//
//  FeedWordTableReusableViewModelProtocol.swift
//  UIComponentsSDK
//
//  Created Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

public protocol FeedWordTableReusableViewModelProtocol: TableReusableViewModelConfigurable {
        
    var text: NSMutableAttributedString { get }
    
    var isOpened: Bool { get }
    
    var didTap: (() -> Void)? { get set }
}
