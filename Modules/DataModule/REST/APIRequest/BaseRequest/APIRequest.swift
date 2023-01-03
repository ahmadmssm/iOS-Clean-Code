//
//  APIRequest.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 07/11/2022.
//

class APIRequest<T: Decodable> {
    
    let path: String
    let headers: [String: String]
    let queryParams: [String: String]
    
    init(path: String, headers: [String: String] = [:], queryParams: [String : String] = [:]) {
        self.path = path
        self.headers = headers
        self.queryParams = queryParams
    }
}
