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
    
    func dequeueHeader(collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView
    
    func dequeueFooter(collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView
    
    func sizeForItem(_ collectionView: UICollectionView) -> CGSize
}

public extension CollectionReusableSupplementaryViewModelConfigurable {
    
    func dequeueHeader(collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView {
        configurator.configureHeader(collectionView, indexPath: indexPath, viewModel: self)
    }
    
    func dequeueFooter(collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView {
        configurator.configureFooter(collectionView, indexPath: indexPath, viewModel: self)
    }
    
    func sizeForItem(_ collectionView: UICollectionView) -> CGSize {
        .zero
    }
}
