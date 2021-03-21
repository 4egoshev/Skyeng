//
//  FeedWordTableReusableView.swift
//  UIComponentsSDK
//
//  Created Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public class FeedWordTableReusableView: UITableViewHeaderFooterView, Configurable {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.attributedText = viewModel?.text
        return label
    }()
    
    public var viewModel: FeedWordTableReusableViewModelProtocol?

    public func bindUI() {
        
    }

    public func setupUI() {
        contentView.backgroundColor = .white
        setupLabel()
    }
}

//MARK: Setup
private extension FeedWordTableReusableView {
    func setupLabel() {
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(8)
            $0.right.bottom.equalToSuperview().offset(-8)
        }
    }
}
