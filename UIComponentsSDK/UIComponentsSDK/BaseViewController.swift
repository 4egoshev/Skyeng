//
//  BaseViewController.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 20.03.2021.
//

import UIKit
import SnapKit

open class BaseViewController: UIViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        setupUI()
    }
    
    open func bindUI() {
    
    }
    
    open func setupUI() {
        
    }
}
