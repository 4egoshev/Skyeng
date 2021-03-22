//
//  AlertRoutable.swift
//  SkyEng
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

protocol AlertRoutable {
    func showInfoAlert(title: String?,
                       message: String?)

    func showActionAlert(title: String?,
                         message: String?,
                         actionTitle: String,
                         actionStyle: UIAlertAction.Style,
                         actionHeandler: ((UIAlertAction) -> Void)?,
                         cancelTitle: String,
                         cancelStyle: UIAlertAction.Style,
                         cancelHeandler: ((UIAlertAction) -> Void)?)

    func showQuestionAlert(title: String?,
                           message: String?,
                           agreeTitle: String,
                           agreeStyle: UIAlertAction.Style,
                           agreeHeandler: ((UIAlertAction) -> Void)?,
                           rejectTitle: String,
                           rejectStyle: UIAlertAction.Style,
                           rejectHeandler: ((UIAlertAction) -> Void)?)
}

extension Router where Self: AlertRoutable {
    func showInfoAlert(title: String? = nil,
                       message: String? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.view?.present(alert, animated: true)
        }
    }

    func showActionAlert(title: String? = nil,
                         message: String? = nil,
                         actionTitle: String,
                         actionStyle: UIAlertAction.Style = .default,
                         actionHeandler: ((UIAlertAction) -> Void)?,
                         cancelTitle: String = "Отмена",
                         cancelStyle: UIAlertAction.Style = .cancel,
                         cancelHeandler: ((UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: cancelTitle, style: cancelStyle, handler: cancelHeandler))
            alert.addAction(UIAlertAction(title: actionTitle, style: actionStyle, handler: actionHeandler))
            self.view?.present(alert, animated: true)
        }
    }

    func showQuestionAlert(title: String? = nil,
                           message: String? = nil,
                           agreeTitle: String = "Да",
                           agreeStyle: UIAlertAction.Style = .default,
                           agreeHeandler: ((UIAlertAction) -> Void)? = nil,
                           rejectTitle: String = "Нет",
                           rejectStyle: UIAlertAction.Style = .cancel,
                           rejectHeandler: ((UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: rejectTitle, style: rejectStyle, handler: rejectHeandler))
            alert.addAction(UIAlertAction(title: agreeTitle, style: agreeStyle, handler: agreeHeandler))
            self.view?.present(alert, animated: true)
        }
    }
}
