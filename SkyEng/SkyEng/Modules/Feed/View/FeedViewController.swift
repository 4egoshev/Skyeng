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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension

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

    private lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .gray)
        loader.startAnimating()
        return loader
    }()

    private var keyboardHandler = KeyboardHandler()

    private var viewModel: FeedViewModelProtocol

	init(viewModel: FeedViewModelProtocol) {
		self.viewModel = viewModel
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
        loading <~ viewModel.loading
        endEditing <~ viewModel.endEditing
        tableView.reactive.reloadData <~ viewModel.reloadData
        tableView.reactive.insertRows(animation: .fade) <~ viewModel.insertRows
        tableView.reactive.deleteRows(animation: .fade) <~ viewModel.deleteRows
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
        keyboardHandler.setup(scrollView: tableView)
        keyboardHandler.didTap = { [weak self] in
            guard let self = self else { return }
            self.searchController.searchBar.endEditing(true)
        }
    }
}

// MARK: - Reactive
private extension FeedViewController {
    var loading: BindingTarget<Bool> {
        BindingTarget(lifetime: lifetime) { [weak self] value in
            guard let self = self else { return }
            self.tableView.tableFooterView = value ? self.loader : nil
        }
    }

    var endEditing: BindingTarget<Bool> {
        BindingTarget(lifetime: lifetime) { [weak self] value in
            guard let self = self else { return }
            self.searchController.isActive = false
            self.searchController.searchBar.resignFirstResponder()
            self.searchController.searchBar.endEditing(value)
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

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        viewModel.willDisplayHeader(at: section)
    }
}

// MARK: UISearchResultsUpdating
extension FeedViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        viewModel.searchtext = text
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
