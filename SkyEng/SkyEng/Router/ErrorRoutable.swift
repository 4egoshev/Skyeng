//
//  ErrorRoutable.swift
//  SkyEng
//
//  Created by Александр Чегошев on 22.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

protocol ErrorRoutable {
    func showError(_ error: Error)
}

extension Router where Self: Error {
    func showError(_ error: Error) {
        DispatchQueue.main.async {
            //TODO: Handle error
        }
    }
}
