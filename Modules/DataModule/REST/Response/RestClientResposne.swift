//
//  RestClientResposne.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 03/01/2023.
//

struct RestClientResposne<T: Decodable> {
    
    let statusCode: Int
    let error: Error?
    let body: T?
    
    init(statusCode: Int) {
        self.statusCode = statusCode
        self.body = nil
        self.error = nil
    }
    
    init(statusCode: Int, body: T) {
        self.statusCode = statusCode
        self.body = body
        self.error = nil
    }
    
    init(statusCode: Int, error: Error) {
        self.statusCode = statusCode
        self.error = error
        self.body = nil
    }
}
