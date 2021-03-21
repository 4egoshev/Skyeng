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
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white

        tableView.tableHeaderView = searchController.searchBar

        return tableView
    }()

    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchResultsUpdater = self
        controller.dimsBackgroundDuringPresentation = false
        controller.searchBar.sizeToFit()
        controller.searchBar.barStyle = .default

        // TODO: убрать
        var frame = UIApplication.shared.statusBarFrame
        frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        let statusBarView = UIView(frame: frame)
        statusBarView.backgroundColor = .white
        controller.view.addSubview(statusBarView)

        return controller
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
        definesPresentationContext = true
        extendedLayoutIncludesOpaqueBars = true
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

// MARK: UISearchResultsUpdating
extension FeedViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.searchtext = searchController.searchBar.text
    }
}
