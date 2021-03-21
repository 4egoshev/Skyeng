//
//  UICollectionView+Extensions.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(type: T.Type) {
        register(type.self, forCellWithReuseIdentifier: type.className)
    }

    func registerCells<T: UICollectionViewCell>(types: [T.Type]) {
        types.forEach { registerCell(type: $0) }
    }
    
    func registerView<T: UICollectionReusableView>(type: T.Type, of kind: String) {
        register(type.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.className)
    }
    
    func registerViews<T: UICollectionReusableView>(types: [T.Type], of kind: String) {
        types.forEach { registerView(type: $0, of: kind) }
    }
    
    func dequeueCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as? T {
            return cell
        }
        registerCell(type: type)
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(with type: T.Type, of kind: String, for indexPath: IndexPath) -> T {
        if let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as? T {
            return view
        }
        registerView(type: type, of: kind)
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.className, for: indexPath) as! T
    }
}
