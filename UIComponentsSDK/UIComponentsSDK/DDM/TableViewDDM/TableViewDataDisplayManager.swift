//
//  TableViewDataDisplayManager.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol TableViewDataDisplayManagerProtocol: UITableViewDataSource, UITableViewDelegate  {
    
    var dataSource: [TableViewCellViewModelConfigurable] { get set }

    var didSelect: ((Int) -> Void)? { get set }
    
    var willDisplay: ((Int) -> Void)? { get set }
    
    var didScroll: ((CGFloat) -> Void)? { get set }
}

public class TableViewDataDisplayManager: NSObject, TableViewDataDisplayManagerProtocol {
    
    public var dataSource: [TableViewCellViewModelConfigurable] = []

    public var didSelect: ((Int) -> Void)?
    
    public var willDisplay: ((Int) -> Void)?
    
    public var didScroll: ((CGFloat) -> Void)?

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        dataSource[indexPath.row].dequeueCell(tableView: tableView)
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect?(indexPath.row)
    }

    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        willDisplay?(indexPath.row)
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        didScroll?(scrollView.contentOffset.y)
    }
}
