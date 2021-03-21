//
//  UITableView+Extensions.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type) {
        register(T.self, forCellReuseIdentifier: cellType.className)
    }

    func register<T: UITableViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { register(cellType: $0) }
    }
    
    func register<T: UITableViewHeaderFooterView>(viewType: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: viewType.className)
    }
    
    func register<T: UITableViewHeaderFooterView>(viewTypes: [T.Type]) {
        viewTypes.forEach { register(viewType: $0) }
    }
    
    func dequeueCell<T: UITableViewCell>(with type: T.Type) -> T {
        if let cell = dequeueReusableCell(withIdentifier: type.className) as? T {
            return cell
        }
        register(cellType: type)
        return dequeueReusableCell(withIdentifier: type.className) as! T
    }
    
    func dequeueView<T: UITableViewHeaderFooterView>(with type: T.Type) -> T {
        if let view = dequeueReusableHeaderFooterView(withIdentifier: type.className) as? T {
            return view
        }
        register(viewType: type)
        return dequeueReusableHeaderFooterView(withIdentifier: type.className) as! T
    }
}
