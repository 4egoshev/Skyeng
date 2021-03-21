//
//  UI.swift
//  UIComponentsSDK
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import UIKit

public enum UI {
    public enum SafeAraa {
        public static var left: CGFloat {
            if #available(iOS 11.0, *) {
                return UIApplication.shared.keyWindow?.safeAreaInsets.left ?? 0
            } else {
                return 0
            }
        }
            
        public static var right: CGFloat {
            if #available(iOS 11.0, *) {
                return UIApplication.shared.keyWindow?.safeAreaInsets.right ?? 0
            } else {
                return 0
            }
        }
        
        public static var top: CGFloat {
            if #available(iOS 11.0, *) {
                return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
            } else {
                return 0
            }
        }
        
        public static var bottom: CGFloat {
            if #available(iOS 11.0, *) {
                return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            } else {
                return 0
            }
        }
        
        public static var statusBarHeight: CGFloat {
            UIApplication.shared.statusBarFrame.height
        }
        
        public static var navigationBarHeight: CGFloat {
            UINavigationBar.appearance().frame.height
        }
    }
}
