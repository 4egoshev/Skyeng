//
//  CollectionViewCellViewModelConfigurable.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol CollectionViewCellViewModelConfigurable {

    var configurator: CollectionViewCellConfigurable { get }
    
    func dequeueCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell

    func sizeForItem(_ collectionView: UICollectionView) -> CGSize
}

public extension CollectionViewCellViewModelConfigurable {
    
    func dequeueCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        configurator.configure(cell: collectionView, indexPath: indexPath, viewModel: self)
    }
    
    func sizeForItem(_ collectionView: UICollectionView) -> CGSize {
        .zero
    }
}
