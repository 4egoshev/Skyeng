//
//  UITableView+Extensions.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func registerCell<T: UITableViewCell>(type: T.Type) {
        register(type.self, forCellReuseIdentifier: type.className)
    }

    func registerCells<T: UITableViewCell>(types: [T.Type]) {
        types.forEach { registerCell(type: $0) }
    }
    
    func registerView<T: UITableViewHeaderFooterView>(type: T.Type) {
        register(type.self, forHeaderFooterViewReuseIdentifier: type.className)
    }
    
    func registerViews<T: UITableViewHeaderFooterView>(types: [T.Type]) {
        types.forEach { registerView(type: $0) }
    }
    
    func dequeueCell<T: UITableViewCell>(with type: T.Type) -> T {
        if let cell = dequeueReusableCell(withIdentifier: type.className) as? T {
            return cell
        }
        registerCell(type: type)
        return dequeueReusableCell(withIdentifier: type.className) as! T
    }
    
    func dequeueView<T: UITableViewHeaderFooterView>(with type: T.Type) -> T {
        if let view = dequeueReusableHeaderFooterView(withIdentifier: type.className) as? T {
            return view
        }
        registerView(type: type)
        return dequeueReusableHeaderFooterView(withIdentifier: type.className) as! T
    }
}
