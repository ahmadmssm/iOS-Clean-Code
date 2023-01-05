//
//  RestClientProtocol.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 07/11/2022.
//

import Foundation

// Ref: https://kean-docs.github.io/get/documentation/get/apiclient/
public protocol RestClientProtocol {
    func invoke<T: Decodable>(api: API) async throws -> T
    func invoke(api: API) async throws -> Data
    // Upload
    // func upload<T>(api: API<T>) async throws -> T
}

