//
//  PlaceholderRoutalble.swift
//  SkyEng
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIComponentsSDK

protocol PlaceholderRoutalble {
    func showPlaceholder(_ placeholder: Placeholder, update: @escaping () -> Void)
    func hidePlaceholder()
}

extension Router where Self: PlaceholderRoutalble {
    func showPlaceholder(_ placeholder: Placeholder = .noConnect, update: @escaping () -> Void) {
        DispatchQueue.main.async {
            let placeholderViewController = PlaceholderViewController(placeholder: placeholder)
            placeholderViewController.update = update
            placeholderViewController.addToParent(self.view, parentView: self.view?.view, animated: true)
        }
    }

    func hidePlaceholder() {
        DispatchQueue.main.async {
            guard let placeholder = self.view?.children.first(where: { $0 is PlaceholderViewController }) else { return }
            placeholder.removeFromParent(animated: true)
        }
    }
}

enum Placeholder {
    case noConnect
    case feed
}

protocol PlaceholderProtocol {
    var update: (() -> Void)? { get set }
}
