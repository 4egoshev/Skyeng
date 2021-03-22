//
//  FeedWordTableViewCell.swift
//  UIComponentsSDK
//
//  Created Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit
import AlamofireImage

public class FeedWordTableViewCell: UITableViewCell, Configurable {
    
    private lazy var pictureView: UIImageView = {
        let pictureView = UIImageView()
        pictureView.contentMode = .scaleAspectFit
        pictureView.image = Image.Feed.placeholder
        return pictureView
    }()
    
    private lazy var containerView: ShadowView = {
        let view = ShadowView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        return view
    }()
    
    private lazy var transcriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .bold(size: 18)
        return label
    }()
    
    private lazy var translationLabel: UILabel = {
        let label = UILabel()
        label.font = .semibold(size: 16)
        return label
    }()
    
    private lazy var soundButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.Feed.icSound, for: .normal)
        button.addTarget(self, action: #selector(didTapPlaySound), for: .touchUpInside)
        return button
    }()
    
    public var viewModel: FeedWordTableViewCellViewModelProtocol?

    public func bindUI() {
        
    }

    public func setupUI() {
        backgroundColor = Color.lightGray
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.addSubview(pictureView)
        containerView.addSubview(transcriptionLabel)
        containerView.addSubview(translationLabel)
        containerView.addSubview(soundButton)
        setupContainerView()
        setupPictureView()
        setupTranscriptionLabel()
        setupTranslationLabel()
        setupSoundButton()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches,with: event)
        guard viewModel?.didTap != nil else { return }
        containerView.setScaleState()
    }
        
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches,with: event)
        guard viewModel?.didTap != nil else { return }
        containerView.setDefaultState()
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches,with: event)
        guard viewModel?.didTap != nil else { return }
        containerView.setDefaultState()
        viewModel?.didTap?()
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
    
    func setupPictureView() {
        pictureView.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
            $0.width.height.equalTo(80)
        }
        
        //TODO: Add host to URL
        guard let url = URL(string: viewModel?.imageUrl ?? ""), let placeholder = Image.Feed.placeholder else { return }
        pictureView.af.setImage(withURL: url, placeholderImage: placeholder)
    }
    
    func setupTranscriptionLabel() {
        transcriptionLabel.text = viewModel?.transcription
        transcriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalTo(pictureView.snp.right).offset(8)
            $0.right.equalToSuperview().offset(-8)
        }
    }
    
    func setupTranslationLabel() {
        translationLabel.text = viewModel?.translation
        translationLabel.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(transcriptionLabel.snp.bottom).offset(12)
            $0.left.equalTo(transcriptionLabel.snp.left)
            $0.right.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func setupSoundButton() {
        soundButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(48)
            $0.right.equalToSuperview().offset(-16)
        }
    }
}

//MARK: Action
private extension FeedWordTableViewCell {
    @objc func didTapPlaySound() {
        viewModel?.didTapPlay?()
    }
}
