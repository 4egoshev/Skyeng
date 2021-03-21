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
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        return view
    }()
    
    private lazy var translationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public var viewModel: FeedWordTableViewCellViewModelProtocol?

    public func bindUI() {
        
    }

    public func setupUI() {
        backgroundColor = .lightGray
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.addSubview(translationLabel)
        setupContainerView()
        setupTranslationLabel()
    }
}

//MARK: Setup
private extension FeedWordTableViewCell {
    func setupContainerView() {
        containerView.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(8)
            $0.right.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func setupTranslationLabel() {
        translationLabel.text = viewModel?.text
        translationLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(8)
            $0.right.bottom.equalToSuperview().offset(-8)
        }
    }
}
