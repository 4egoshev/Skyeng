//
//  Reactive+Extensions.swift
//  SkyEng
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import ReactiveSwift

extension Reactive where Base: UITableView {
    var resize: BindingTarget<()> {
        makeBindingTarget { tableView, _ in
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }

    func reloadRows(animation: UITableView.RowAnimation) -> BindingTarget<([IndexPath])> {
        makeBindingTarget { $0.reloadRows(at: $1, with: animation) }
    }

    func insertRows(animation: UITableView.RowAnimation) -> BindingTarget<([IndexPath])> {
        makeBindingTarget { $0.insertRows(at: $1, with: animation) }
    }

    func deleteRows(animation: UITableView.RowAnimation) -> BindingTarget<([IndexPath])> {
        makeBindingTarget { $0.deleteRows(at: $1, with: animation) }
    }

    func reloadSection(animation: UITableView.RowAnimation) -> BindingTarget<(IndexSet)> {
        makeBindingTarget { $0.reloadSections($1, with: animation) }
    }

    func insertSection(animation: UITableView.RowAnimation) -> BindingTarget<(IndexSet)> {
        makeBindingTarget { $0.insertSections($1, with: animation) }
    }

    func deleteSection(animation: UITableView.RowAnimation) -> BindingTarget<(IndexSet)> {
        makeBindingTarget { $0.deleteSections($1, with: animation) }
    }
}
