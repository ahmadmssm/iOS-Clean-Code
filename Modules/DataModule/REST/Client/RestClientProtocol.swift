//
//  RestClientProtocol.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 07/11/2022.
//

import Foundation

// Ref: https://kean-docs.github.io/get/documentation/get/apiclient/
protocol RestClientProtocol {
    func invoke<T>(api: APIRequest<T>) async throws -> T
    func invoke<T>(api: APIRequest<T>) async throws -> Data
    // Upload
    // func upload<T>(api: APIRequest<T>) async throws -> T
}

