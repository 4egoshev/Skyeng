//
//  UIViewController+Extemsions.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public extension UIViewController {
    func addToParent(_ parent: UIViewController?, parentView: UIView?, animated: Bool, completion: ((Bool) -> Void)? = nil) {
        guard let parent = parent, let parentView = parentView else { return }
        parent.addChild(self)

        view.translatesAutoresizingMaskIntoConstraints = true
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = parentView.bounds
        parentView.addSubview(view)
        
        if animated {
            UIView.animate(withDuration: 0.3, delay: 0, options: [.transitionCrossDissolve], animations: { }, completion: { _ in
                self.didMove(toParent: parent)
                completion?(true)
            })
        } else {
            didMove(toParent: parent)
            completion?(true)
        }
    }
    
    func removeFromParent(animated: Bool, completion: ((Bool) -> Void)? = nil) {
        view.removeFromSuperview()
        
        if animated {
            UIView.animate(withDuration: 0.3, delay: 0, options: [.transitionCrossDissolve], animations: { }, completion: { _ in
                self.removeFromParent()
                completion?(true)
            })
        } else {
            removeFromParent()
            completion?(true)
        }
    }
}
