//
//  CollectionViewCellConfigurator.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public struct CollectionViewCellConfigurator<CellType: ConfigurableCell, ViewModel>: CollectionViewCellConfigurable where CellType.ViewModel == ViewModel, CellType: UICollectionViewCell {

    public var reuseId: String {
        String(describing: CellType.self)
    }

    public func configure(cell collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionViewCellViewModelConfigurable) -> UICollectionViewCell {
        var cell = collectionView.dequeueCell(with: CellType.self, for: indexPath)
        cell.configureCell(viewModel as? ViewModel)
        return cell
    }
}

