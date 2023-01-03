//
//  RestClient.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 07/11/2022.
//

import Get
import Foundation

struct RestClient: RestClientProtocol {
    
    private let apiClient: APIClient

    init(baseURL: String,
         globalHeaders: [String : String] = [:],
         restClientConfigParams: RestClientConfigParams = RestClientConfigParams()) {
        let configs = APIClientConfigurationFactory(baseURL: baseURL, restClientConfigParams: restClientConfigParams)
            .set(globalHeaders: globalHeaders)
            .set(globalHeaders: globalHeaders)
            
            .create()
        self.apiClient = APIClient(configuration: configs)
    }
    
    func invoke<T>(api: APIRequest<T>) async throws -> T {
        let request = APIRequest<T>.createRequest(from: api)
        return try await self.apiClient.send(request).value
    }
    
    func invoke<T>(api: APIRequest<T>, cachePolicy: URLRequest.CachePolicy, sessionDelegate: URLSessionDataDelegate) async throws -> T {
        let request = APIRequest<T>.createRequest(from: api)
        return try await apiClient.send(request, delegate: sessionDelegate) {
            $0.cachePolicy = cachePolicy
        }.value
    }
    
    
    func invoke<T>(api: APIRequest<T>) async throws -> Data where T : Decodable {
        let request = APIRequest<T>.createRequest(from: api)
        return try await self.apiClient.send(request).data
    }
}
