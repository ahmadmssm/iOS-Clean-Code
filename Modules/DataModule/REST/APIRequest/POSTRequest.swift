//
//  POSTRequest.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 07/11/2022.
//

import Foundation

class POSTRequest<T: Decodable>: APIRequest<T> {
    
    let body: Encodable
    
    init(path: String, headers: [String: String] = [:], queryParams: [String : String] = [:], body: [String : String]) {
        self.body = body
        super.init(path: path, headers: headers, queryParams: queryParams)
    }
    
    init(path: String, headers: [String: String] = [:], queryParams: [String : String] = [:], body: [String : [String : String]]) {
        self.body = body
        super.init(path: path, headers: headers, queryParams: queryParams)
    }
    
    init(path: String, headers: [String: String] = [:], queryParams: [String : String] = [:], body: String) {
        self.body = body
        super.init(path: path, headers: headers, queryParams: queryParams)
    }
    
    init(path: String, headers: [String: String] = [:], queryParams: [String : String] = [:], body: Data) {
        self.body = body
        super.init(path: path, headers: headers, queryParams: queryParams)
    }
    
    init(path: String, headers: [String: String] = [:], queryParams: [String : String] = [:], body: Encodable) {
        self.body = body
        super.init(path: path, headers: headers, queryParams: queryParams)
    }
}
