//
//  Configurable.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

public protocol Configurable {

    associatedtype ViewModel

    var viewModel: ViewModel? { get set }

    func bindUI()

    func setupUI()

    mutating func configure(_ viewModel: ViewModel?)
}

public extension Configurable {
    mutating func configure(_ viewModel: ViewModel?) {
        self.viewModel = viewModel
        self.bindUI()
        self.setupUI()
    }
}
