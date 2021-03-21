//
//  CollectionReusableSupplementaryViewConfigurator.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public struct CollectionReusableSupplementaryViewConfigurator<ViewType: Configurable, ViewModel>: CollectionReusableSupplementaryViewConfigurable where ViewType.ViewModel == ViewModel, ViewType: UICollectionReusableView {
    
    public func configureHeader(_ collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionReusableSupplementaryViewModelConfigurable) -> UICollectionReusableView {
        var view = collectionView.dequeue(view: ViewType.self, of: UICollectionView.elementKindSectionHeader, for: indexPath)
        view.configure(viewModel as? ViewModel)
        return view
    }
    
    public func configureFooter(_ collectionView: UICollectionView, indexPath: IndexPath, viewModel: CollectionReusableSupplementaryViewModelConfigurable) -> UICollectionReusableView {
        var view = collectionView.dequeue(view: ViewType.self, of: UICollectionView.elementKindSectionFooter, for: indexPath)
        view.configure(viewModel as? ViewModel)
        return view
    }
}
