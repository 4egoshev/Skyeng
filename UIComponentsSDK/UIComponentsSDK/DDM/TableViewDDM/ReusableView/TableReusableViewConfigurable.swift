//
//  TableReusableViewConfigurable.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol TableReusableViewConfigurable {
    
    func configureView(_ tableView: UITableView, viewModel: TableReusableViewModelConfigurable) -> UITableViewHeaderFooterView
}
