//
//  TableReusableViewModelConfigurable.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol TableReusableViewModelConfigurable {
    
    var configurator: TableReusableViewConfigurable { get }

    func dequeueCell(tableView: UITableView) -> UITableViewHeaderFooterView
}

public extension TableReusableViewModelConfigurable {
    
    func dequeueCell(tableView: UITableView) -> UITableViewHeaderFooterView {
        configurator.configureView(tableView, viewModel: self)
    }
}
