//
//  DI.swift
//  CleanCodeDemoApp
//
//  Created by Ahmad Mahmoud on 03/01/2023.
//

import Factory
import DataModule

extension Container: AutoRegistering {

//    static let class3 = Factory { Class3(class1: class1()) }
//    static let api = Factory { CountriesAPIs() }
//    static let repo = Factory { Repo(api: api(), restClient: restclient()) }
    
    public static func registerAllServices() {
        // ModuleA.register()
       //  ModuleB.register()
    }
}
