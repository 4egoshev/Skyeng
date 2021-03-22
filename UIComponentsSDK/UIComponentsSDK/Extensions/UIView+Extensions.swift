//
//  UIView+Extensions.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit
import SnapKit

//MARK: Scale
extension UIView {
    func setScaleState(duration: TimeInterval = 0.2,
                       scaleValue: CGFloat = 0.92,
                       completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration) {
            self.transform = CGAffineTransform(scaleX: scaleValue, y: scaleValue)
        } completion: { _ in
            completion?()
        }
    }
    
    func setDefaultState(duration: TimeInterval = 0.2,
                         completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration) {
            self.transform = .identity
        } completion: { _ in
            completion?()
        }
    }
}
