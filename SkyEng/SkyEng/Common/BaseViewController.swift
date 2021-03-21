//
//  BaseViewController.swift
//  SkyEng
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit
import SnapKit
import ReactiveSwift

class BaseViewController: UIViewController {

    // MARK: Properties
    var (lifetime, token) = Lifetime.make()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        setupUI()
    }

    func bindUI() {

    }

    func setupUI() {

    }
}
