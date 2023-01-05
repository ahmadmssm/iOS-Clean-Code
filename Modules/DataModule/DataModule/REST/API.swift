//
//  API.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 07/11/2022.
//

public enum API {
    case GET(path: String, headers: [String: String] = [:], queryParams: [String : String] = [:])
    case POST(path: String, headers: [String: String] = [:], queryParams: [String : String] = [:], body: Encodable)
}
