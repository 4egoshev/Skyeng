//
//  KeyboardHandler.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public protocol KeyboardHandlerProtocol: class {

    var didTap: (() -> Void)? { get set }

    func setup(scrollView: UIScrollView, mainView: UIView?, addTapGesture: Bool, bottomView: UIView?)
}

public extension KeyboardHandlerProtocol {
    func setup(scrollView: UIScrollView, mainView: UIView? = nil, addTapGesture: Bool = true, bottomView: UIView? = nil) {
        setup(scrollView: scrollView, mainView: mainView, addTapGesture: addTapGesture, bottomView: bottomView)
    }
}

public class KeyboardHandler: NSObject {

    public var didTap: (() -> Void)?

    private weak var view: UIView?
    private weak var scrollView: UIScrollView?
    private weak var bottomView: UIView?

    private var defaultInsets: UIEdgeInsets = .zero

    private var notificationCenter: NotificationCenter {
        return NotificationCenter.default
    }

    public override init() {
        super.init()
        subscribeToKeyboardNotifications()
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    private func addTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false

        view?.addGestureRecognizer(tapGesture)
    }

    private func subscribeToKeyboardNotifications() {
        notificationCenter.addObserver(self,
                                       selector: #selector(keyboardWillMove(_:)),
                                       name: UIResponder.keyboardWillShowNotification,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(keyboardWillMove(_:)),
                                       name: UIResponder.keyboardWillHideNotification,
                                       object: nil)
    }

    private func unsubscribeFromKeyboardNotifications() {
        notificationCenter.removeObserver(self,
                                          name: UIResponder.keyboardWillShowNotification,
                                          object: nil)
        notificationCenter.removeObserver(self,
                                          name: UIResponder.keyboardWillHideNotification,
                                          object: nil)
    }
}

//MARK: Actions
extension KeyboardHandler: KeyboardHandlerProtocol {
    public func setup(scrollView: UIScrollView,
                      mainView: UIView?,
                      addTapGesture: Bool,
                      bottomView: UIView?) {
        self.scrollView = scrollView
        self.bottomView = bottomView
        self.view = mainView != nil ? mainView : scrollView

        self.defaultInsets = scrollView.contentInset

        if addTapGesture {
            addTap()
        }
    }
}

//MARK: Actions
extension KeyboardHandler {
    @objc private func keyboardWillMove(_ notification: Notification) {
        if notification.name == UIResponder.keyboardWillShowNotification {
            if let userInfo = notification.userInfo {
                let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect

                scrollView?.contentInset = UIEdgeInsets(top: defaultInsets.top,
                                                        left: 0,
                                                        bottom: keyboardFrame.height - UI.SafeAraa.bottom,
                                                        right: 0)

                guard let bottomView = bottomView else { return }
                bottomView.transform = CGAffineTransform(translationX: 0, y: -keyboardFrame.height +  UI.SafeAraa.bottom)
            }
        }
        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView?.contentInset = defaultInsets
            guard let bottomView = bottomView else { return }
            bottomView.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }

    @objc private func viewTapped() {
        guard didTap != nil else {
            view?.endEditing(true)
            return
        }
        didTap?()
    }
}

//MARK: UIGestureRecognizerDelegate
extension KeyboardHandler: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let activeView = touch.view  else { return true }
        return !activeView.isKind(of: UIControl.self)
    }
}
