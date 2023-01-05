//
//  ClientDelegate.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 03/01/2023.
//

import Get
import Foundation

final class ClientDelegate: APIClientDelegate {
    
    private var accessToken: String = ""

    func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws {
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    }
}


// https://kean-docs.github.io/get/documentation/get/authentication/
//final class RefreshTokenClientDelegate: APIClientDelegate {
//    
//    private let sessionServiceProtocol: SessionServiceProtocol
//    
//    init(sessionServiceProtocol: SessionServiceProtocol) {
//        self.sessionServiceProtocol = sessionServiceProtocol
//    }
//    
//    func client(_ client: APIClient, shouldRetry task: URLSessionTask, error: Error, attempts: Int) async throws -> Bool {
//        if case .unacceptableStatusCode(let statusCode) = error as? APIError,
//           statusCode == 401, attempts == 1 {
//            accessToken = try await refreshAccessToken()
//            return true
//        }
//        return false
//    }
//
//
//    private func refreshAccessToken() async throws -> String {
//        fatalError("Not implemented")
//    }
//}


protocol SessionServiceProtocol {
    func accessToken() -> String
}
