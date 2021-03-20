//
//  Router.swift
//  SkyEng
//
//  Created by Александр Чегошев on 20.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

protocol Router {

    var view: UIViewController? { get set }

    func push(controller: UIViewController, animated: Bool)

    func pop(animated: Bool)

    func present(controller: UIViewController, animated: Bool, completion: (() -> Void)?)

    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension Router {

    func push(controller: UIViewController, animated: Bool = true) {
        view?.navigationController?.pushViewController(controller, animated: animated)
    }

    func pop(animated: Bool = true) {
        view?.navigationController?.popViewController(animated: animated)
    }

    func present(controller: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        view?.present(controller, animated: animated, completion: completion)
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        view?.dismiss(animated: animated, completion: completion)
    }
}
