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
