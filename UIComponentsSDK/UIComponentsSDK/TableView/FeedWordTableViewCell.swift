//
//  FeedWordTableViewCell.swift
//  UIComponentsSDK
//
//  Created Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public class FeedWordTableViewCell: UITableViewCell, Configurable {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    public var viewModel: FeedWordTableViewCellViewModelProtocol?

    public func bindUI() {
        
    }

    public func setupUI() {
        contentView.addSubview(containerView)
        setupContainerView()
    }
}

//MARK: Setup
private extension FeedWordTableViewCell {
    func setupContainerView() {
        containerView.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(8)
            $0.right.bottom.equalToSuperview().offset(-8)
            $0.height.equalTo(80)
        }
    }
}
