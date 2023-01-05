//
//  HTTPClientConfiguration.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 08/11/2022.
//

import Get
import Pulse
import Foundation

class HTTPClientConfiguration {
    
    private var apiClientConfiguration: APIClient.Configuration
    
    init(baseURL: String, sessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default) {
        if let url = URL(string: baseURL) {
            self.apiClientConfiguration = APIClient.Configuration(baseURL: url, sessionConfiguration: sessionConfiguration)
        }
        else {
            fatalError("Invalid URL!")
        }
    }
    
    func set(globalHeaders: [String : String]) -> HTTPClientConfiguration {
        self.apiClientConfiguration.sessionConfiguration.httpAdditionalHeaders = globalHeaders
        return self
    }
    
    func set(protocolClass: AnyClass) -> HTTPClientConfiguration {
        if ((self.apiClientConfiguration.sessionConfiguration.protocolClasses?.isEmpty) != nil) {
            self.apiClientConfiguration.sessionConfiguration.protocolClasses = [protocolClass]
        }
        else {
            self.apiClientConfiguration.sessionConfiguration.protocolClasses?.append(protocolClass)
        }
        return self
    }
    
    func set(protocolClasses: [AnyClass]) -> HTTPClientConfiguration {
        if ((self.apiClientConfiguration.sessionConfiguration.protocolClasses?.isEmpty) != nil) {
            self.apiClientConfiguration.sessionConfiguration.protocolClasses = protocolClasses
        }
        else {
            self.apiClientConfiguration.sessionConfiguration.protocolClasses?.append(contentsOf: protocolClasses)
        }
        return self
    }
    
    // This can not be used with the logger, either the logger or this one.
    // Whatever set last will be used and will override the previous one.
    func set(sessionDelegate: URLSessionDelegate) -> HTTPClientConfiguration {
        self.apiClientConfiguration.sessionDelegate = sessionDelegate
        return self
    }
    
    func set(jsonEncoder: JSONEncoder) -> HTTPClientConfiguration {
        self.apiClientConfiguration.encoder = jsonEncoder
        return self
    }
    
    func set(sessionConfiguration: URLSessionConfiguration) -> HTTPClientConfiguration {
        self.apiClientConfiguration.sessionConfiguration = sessionConfiguration
        return self
    }
    
    // Pulse Logger: https://github.com/kean/Get#pulse
    // This can not be used with the custom sessionDelegate, either the custom sessionDelegate or this one.
    // Whatever set last will be used and will override the previous one.
    func addHttpLogger() -> HTTPClientConfiguration {
        self.apiClientConfiguration.sessionDelegate = Pulse.URLSessionProxyDelegate()
        return self
    }
    
    func create() -> APIClient.Configuration {
        return self.apiClientConfiguration
    }
}
