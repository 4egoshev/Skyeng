//
//  CollectionReusableSupplementaryViewModelConfigurable.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol CollectionReusableSupplementaryViewModelConfigurable {
    
    var configurator: CollectionReusableSupplementaryViewConfigurable { get }
    
    func dequeue(collectionView: UICollectionView, of kind: String, for indexPath: IndexPath) -> UICollectionReusableView
    
    func sizeForItem(_ collectionView: UICollectionView) -> CGSize
}

public extension CollectionReusableSupplementaryViewModelConfigurable {
    
    func dequeue(collectionView: UICollectionView, of kind: String, for indexPath: IndexPath) -> UICollectionReusableView {
        configurator.configureReusableSupplementaryView(collectionView, ofKind: kind, indexPath: indexPath, viewModel: self)
    }
    
    func sizeForItem(_ collectionView: UICollectionView) -> CGSize {
        .zero
    }
}
