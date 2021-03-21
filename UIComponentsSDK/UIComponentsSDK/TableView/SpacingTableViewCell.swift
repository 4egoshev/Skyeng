//
//  SpacingTableViewCell.swift
//  UIComponentsSDK
//
//  Created Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public class SpacingTableViewCell: UITableViewCell, Configurable {
    
    private lazy var spacingView: UIView = {
        let view = UIView()
        return view
    }()
    
    public var viewModel: SpacingTableViewCellViewModelProtocol?

    public func bindUI() {
        
    }

    public func setupUI() {
        selectionStyle = .none
        contentView.addSubview(spacingView)
        spacingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(1).priority(.high)
        }
    }
}

//MARK: Setup
private extension SpacingTableViewCell {
    
}
