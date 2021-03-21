//
//  TableReusableViewConfigurator.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public struct TableReusableViewConfigurator<ViewType: Configurable, ViewModel>: TableReusableViewConfigurable where ViewType.ViewModel == ViewModel, ViewType: UITableViewHeaderFooterView {
    
    public func configureView(_ tableView: UITableView, viewModel: TableReusableViewModelConfigurable) -> UITableViewHeaderFooterView {
        var view = tableView.dequeueView(with: ViewType.self)
        view.configure(viewModel as? ViewModel)
        return view
    }
}
