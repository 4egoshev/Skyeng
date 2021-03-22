//
//  PlaceholderViewController.swift
//  SkyEng
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

class PlaceholderViewController: BaseViewController {

    var update: (() -> Void)?

    private let placeholder: Placeholder

    init(placeholder: Placeholder) {
        self.placeholder = placeholder
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        var placeholderView: UIView?

        switch placeholder {
        case .noConnect:
            placeholderView = UIView()
        case .feed:
            placeholderView = UIView()
        }

        view = placeholderView
    }
}
