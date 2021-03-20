//
//  TableViewCellViewModelConfigurable.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol TableViewCellViewModelConfigurable {

    var configurator: TableViewCellConfigurable { get }

    func dequeueCell(tableView: UITableView) -> UITableViewCell
}

public extension TableViewCellViewModelConfigurable {
    
    func dequeueCell(tableView: UITableView) -> UITableViewCell? {
        configurator.configure(cell: tableView, viewModel: self)
    }
}
