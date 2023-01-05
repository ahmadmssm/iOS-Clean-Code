//
//  DataModuleContainer.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 03/01/2023.
//

import Factory
import EnvironmentVariables

public extension SharedContainer {
    
    static let restclient = Factory<RestClientProtocol> {
        let baseURL = EnvironmentVariables.baseURL
        return RestClient(baseURL: baseURL)
    }
}
