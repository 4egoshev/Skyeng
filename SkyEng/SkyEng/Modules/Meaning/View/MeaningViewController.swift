//
//  MeaningViewController.swift
//  SkyEng
//
//  Created by Chegoshev Aleksandr on 22/03/2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit
import UIComponentsSDK

class MeaningViewController: BaseViewController {

    private var viewModel: MeaningViewModelProtocol

	init(viewModel: MeaningViewModelProtocol) {
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

	}

	override func setupUI() {
        view.backgroundColor = .white
	}
}

// MARK: Setup
private extension MeaningViewController {

}
