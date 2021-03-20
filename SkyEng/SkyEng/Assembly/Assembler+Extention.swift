//
//  Assembler+Extention.swift
//  SkyEng
//
//  Created by Александр Чегошев on 20.03.2021.
//

import Swinject

extension Assembler {
    func registerAssemblies() {
        var assemblies = [Assembly]()
        
        apply(assemblies: assemblies)
    }
}
