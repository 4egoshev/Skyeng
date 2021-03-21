//
//  TableViewCellConfigurable.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol TableViewCellConfigurable {

    var reuseId: String { get }

    func configure(cell tableView: UITableView, viewModel: TableViewCellViewModelConfigurable) -> UITableViewCell
}
