//
//  UIViewController+Extensions.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public extension UIViewController {

    func embeded() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
