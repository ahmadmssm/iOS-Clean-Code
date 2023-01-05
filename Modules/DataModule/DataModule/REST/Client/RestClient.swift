//
//  RestClient.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 07/11/2022.
//

import Get
import Foundation

// HTTP Client: https://github.com/kean/Get#pulse
struct RestClient: RestClientProtocol {
    
    private let apiClient: APIClient

    init(baseURL: String, globalHeaders: [String : String] = [:]) {
        let httpClientConfigs = HTTPClientConfiguration(baseURL: baseURL)
            .set(globalHeaders: globalHeaders)
            .create()
        self.apiClient = APIClient(configuration: httpClientConfigs)
    }
    
    func invoke<T: Decodable>(api: API) async throws -> T where T : Decodable {
        let request: Request<T> = self.createHttpRequest(api: api)
        return try await self.apiClient.send(request).value
    }
    
    func invoke(api: API) async throws -> Data {
        let request: Request<Date> = self.createHttpRequest(api: api)
        return try await self.apiClient.send(request).data
    }
    
    private func createHttpRequest<T: Decodable>(api: API) -> Request<T> {
        switch api {
        case .GET(let path, let headers, let queryParams):
            let queryParams = queryParams.map { ($0, $1) }
            return Request(path: path, method: .get, query: queryParams, headers: headers)
        case .POST(let path, let headers, let queryParams, let body):
            let queryParams = queryParams.map { ($0, $1) }
            return Request(path: path, method: .post, query: queryParams, body: body, headers: headers)
        }
    }
}
