//
//  FeedWordTableViewCellViewModelProtocol.swift
//  UIComponentsSDK
//
//  Created Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

public protocol FeedWordTableViewCellViewModelProtocol: TableViewCellViewModelConfigurable {
        
    var translation: String { get }
    
    var transcription: String { get }
    
    var imageUrl: String { get }
    
    var didTap: (() -> Void)? { get set }
    
    var didTapPlay: (() -> Void)? { get set }
}
