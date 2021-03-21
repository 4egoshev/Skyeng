//
//  CollectionViewCellConfigurable.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol CollectionViewCellConfigurable {

    func configure(cell collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionViewCellViewModelConfigurable) -> UICollectionViewCell
}
