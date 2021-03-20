//
//  Assembler+Extention.swift
//  SkyEng
//
//  Created by Александр Чегошев on 20.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Swinject

extension Assembler {
    func registerAssemblies() {
        var assemblies = [Assembly]()
        assemblies.append(contentsOf: serviceAssemblies)
        assemblies.append(contentsOf: moduleAssemblies)

        apply(assemblies: assemblies)
    }

    private var serviceAssemblies: [Assembly] {
        [
            ServiceAssembly()
        ]
    }

    private var moduleAssemblies: [Assembly] {
        [
            ModuleAssembly()
        ]
    }
}
