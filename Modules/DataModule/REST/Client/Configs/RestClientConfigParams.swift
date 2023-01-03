//
//  RestClientConfigParams.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 07/11/2022.
//

import Get
import Foundation

class RestClientConfigParams {
    
    private(set) var protocolClasses: [AnyClass]?
    private(set) var sessionDelegate: URLSessionDelegate?
    private(set) var jsonEncoder: JSONEncoder = JSONEncoder()
    private(set) var sessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default
    
    func set(protocolClasses: [AnyClass]) -> RestClientConfigParams {
        self.protocolClasses = protocolClasses
        return self
    }
    
    func set(sessionDelegate: URLSessionDelegate) -> RestClientConfigParams {
        self.sessionDelegate = sessionDelegate
        return self
    }
    
    func set(jsonEncoder: JSONEncoder) -> RestClientConfigParams {
        self.jsonEncoder = jsonEncoder
        return self
    }
    
    func set(sessionConfiguration: URLSessionConfiguration) -> RestClientConfigParams {
        self.sessionConfiguration = sessionConfiguration
        return self
    }
}
