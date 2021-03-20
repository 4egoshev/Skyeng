//
//  CellConfigurable.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

public protocol CellConfigurable {

    associatedtype ViewModel

    var viewModel: ViewModel? { get set }

    func bindUI()

    func setupUI()

    mutating func configureCell(_ viewModel: ViewModel?)
}

public extension CellConfigurable {
    mutating func configureCell(_ viewModel: ViewModel?) {
        self.viewModel = viewModel
        self.bindUI()
        self.setupUI()
    }
}
