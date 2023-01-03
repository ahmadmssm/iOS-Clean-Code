//
//  APIClientConfigurationFactory.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 08/11/2022.
//

import Get
import Foundation

class APIClientConfigurationFactory {
    
    private let baseURL: String
    private let restClientConfigParams: RestClientConfigParams
    private var globalHeaders: [String : String] = [:]
    
    init(baseURL: String, restClientConfigParams: RestClientConfigParams) {
        self.baseURL = baseURL
        self.restClientConfigParams = restClientConfigParams
    }
    
    func set(globalHeaders: [String : String]) -> APIClientConfigurationFactory {
        self.globalHeaders = globalHeaders
        return self
    }
    
    func create() -> APIClient.Configuration {
        let url = URL(string: baseURL)
        var clientConfig = APIClient.Configuration(baseURL: url,
                                                   sessionConfiguration: restClientConfigParams.sessionConfiguration)
        clientConfig.encoder = restClientConfigParams.jsonEncoder
        clientConfig.sessionDelegate = restClientConfigParams.sessionDelegate
        clientConfig.sessionConfiguration.httpAdditionalHeaders = self.globalHeaders
        clientConfig.sessionConfiguration.protocolClasses = restClientConfigParams.protocolClasses
        return clientConfig
    }
}
