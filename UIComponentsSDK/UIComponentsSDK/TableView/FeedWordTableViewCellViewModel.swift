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
    
    public var translation: String
    
    public var transcription: String
    
    public var imageUrl: String
    
    public var didTap: (() -> Void)?
    
    public var didTapPlay: (() -> Void)?
    
    public var configurator: TableViewCellConfigurable = FeedWordTableViewCellConfigurator()
    
    public init(translation: String,
                transcription: String,
                imageUrl: String) {
        self.translation = translation
        self.transcription = transcription
        self.imageUrl = imageUrl
    }
}
