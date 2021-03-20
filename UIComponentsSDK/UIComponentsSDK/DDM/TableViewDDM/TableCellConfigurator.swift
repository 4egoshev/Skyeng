//
//  TableCellConfigurator.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public struct TableViewCellConfigurator<CellType: CellConfigurable, ViewModel>: TableViewCellConfigurable where CellType.ViewModel == ViewModel, CellType: UITableViewCell {

    public var reuseId: String {
        String(describing: CellType.self)
    }

    public func configure(cell tableView: UITableView, viewModel: TableViewCellViewModelConfigurable) -> UITableViewCell {
        var cell = tableView.dequeueCell(with: CellType.self)
        cell.configureCell(viewModel as? ViewModel)
        return cell
    }
}
