//
//  BaseViewController.swift
//  SkyEng
//
//  Created by Александр Чегошев on 20.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }


}

