//
//  ReusableSupplementaryViewConfigurator.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol ReusableSupplementaryViewConfigurator {

    var reuseId: String { get }

    func configureReusableSupplementaryView(_ collectionView: UICollectionView, ofKind: String, indexPath: IndexPath, viewModel: ReusableSupplementaryViewModelConfigurable) -> UICollectionReusableView
}
