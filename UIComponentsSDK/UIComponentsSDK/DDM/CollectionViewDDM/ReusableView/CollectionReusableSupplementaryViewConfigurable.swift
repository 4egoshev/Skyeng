//
//  CollectionReusableSupplementaryViewConfigurable.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol CollectionReusableSupplementaryViewConfigurable {
    
    func configureHeader(_ collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionReusableSupplementaryViewModelConfigurable) -> UICollectionReusableView
    
    func configureFooter(_ collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionReusableSupplementaryViewModelConfigurable) -> UICollectionReusableView
}
