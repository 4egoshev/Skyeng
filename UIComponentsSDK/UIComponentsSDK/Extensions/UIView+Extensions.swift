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
public extension UIView {
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

//MARK: Shadow
public extension UIView {
    func addShadow(offset: CGSize = .zero, color: UIColor = .black, opacity: Float = 0.2, radius: CGFloat = 6.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}

//MARK: Corrners
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
