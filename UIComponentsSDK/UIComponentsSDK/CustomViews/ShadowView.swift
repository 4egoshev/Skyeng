//
//  ShadowView.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public class ShadowView: UIView {

    public var offset: CGSize = .zero
    public var color: UIColor = .black
    public var opacity: Float = 0.2
    public var radius: CGFloat = 6.0
    
    private var didSetup: Bool = false

    public override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow()
    }
    
    private func setupShadow() {
        guard !didSetup else { return }
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    
        didSetup = true
    }
}
