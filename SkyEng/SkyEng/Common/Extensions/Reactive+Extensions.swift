//
//  Reactive+Extensions.swift
//  SkyEng
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import ReactiveSwift

extension Reactive where Base: UITableView {
    public func reloadRows(animation: UITableView.RowAnimation) -> BindingTarget<([IndexPath])> {
        return makeBindingTarget { $0.reloadRows(at: $1, with: animation) }
    }

    public func insertRows(animation: UITableView.RowAnimation) -> BindingTarget<([IndexPath])> {
        return makeBindingTarget { $0.insertRows(at: $1, with: animation) }
    }

    public func deleteRows(animation: UITableView.RowAnimation) -> BindingTarget<([IndexPath])> {
        return makeBindingTarget { $0.deleteRows(at: $1, with: animation) }
    }

    public func reloadSection(animation: UITableView.RowAnimation) -> BindingTarget<(IndexSet)> {
        return makeBindingTarget { $0.reloadSections($1, with: animation) }
    }

    public func insertSection(animation: UITableView.RowAnimation) -> BindingTarget<(IndexSet)> {
        return makeBindingTarget { $0.insertSections($1, with: animation) }
    }

    public func deleteSection(animation: UITableView.RowAnimation) -> BindingTarget<(IndexSet)> {
        return makeBindingTarget { $0.deleteSections($1, with: animation) }
    }
}
