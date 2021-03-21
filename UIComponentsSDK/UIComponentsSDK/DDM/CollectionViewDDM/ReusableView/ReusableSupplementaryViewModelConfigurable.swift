//
//  ReusableSupplementaryViewModelConfigurable.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol ReusableSupplementaryViewModelConfigurable {
    
    var configurator: ReusableSupplementaryViewConfigurator { get }
    
    var size: CGSize { get }
    
    init(configurator: ReusableSupplementaryViewConfigurator)
    
    func dequeue(view collectionView: UICollectionView, of kind: String, for indexPath: IndexPath) -> UICollectionReusableView
}
