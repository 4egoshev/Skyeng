//
//  CollectionReusableSupplementaryViewConfigurator.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public struct CollectionReusableSupplementaryViewConfigurator<ReusableSupplementaryViewType: Configurable, ViewModel>: CollectionReusableSupplementaryViewConfigurable where ReusableSupplementaryViewType.ViewModel == ViewModel, ReusableSupplementaryViewType: UICollectionReusableView {
    public var reuseId: String { return String(describing: ReusableSupplementaryViewType.self) }

    public func configureReusableSupplementaryView(_ collectionView: UICollectionView, ofKind: String, indexPath: IndexPath, viewModel: CollectionReusableSupplementaryViewModelConfigurable) -> UICollectionReusableView {
        var view = collectionView.dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: reuseId, for: indexPath) as! ReusableSupplementaryViewType
        view.configure(viewModel as? ViewModel)
        return view
    }
}
