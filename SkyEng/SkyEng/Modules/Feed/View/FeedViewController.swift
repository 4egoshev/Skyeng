//
//  FeedViewController.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 21/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit
import UIComponentsSDK

class FeedViewController: BaseViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = ddm
        tableView.delegate = ddm
        ddm.dataSource = viewModel.dataSource
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
