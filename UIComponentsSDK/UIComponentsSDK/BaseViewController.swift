//
//  BaseViewController.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 20.03.2021.
//

import UIKit

public class BaseViewController: UIViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
