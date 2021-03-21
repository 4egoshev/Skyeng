//
//  FeedViewController.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit
import UIComponentsSDK
import ReactiveSwift
import ReactiveCocoa

class FeedViewController: BaseViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    private var viewModel: FeedViewModelProtocol

    private let ddm: TableViewDataDisplayManagerProtocol

	init(viewModel: FeedViewModelProtocol,
         ddm: TableViewDataDisplayManagerProtocol = TableViewDataDisplayManager()) {
		self.viewModel = viewModel
        self.ddm = ddm
		super.init()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		viewModel.viewDidLoad()
    }

    override func bindUI() {
        tableView.reactive.reloadData <~ viewModel.reloadData
	}

	override func setupUI() {
        view.backgroundColor = .white
        setupTableView()
	}
}

// MARK: Setup
private extension FeedViewController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.headers.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.dataSource[indexPath.section][indexPath.row].dequeueCell(tableView: tableView)
    }
}

// MARK: UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        viewModel.headers[section].dequeueCell(tableView: tableView)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        viewModel.headers[section].height
    }
}
