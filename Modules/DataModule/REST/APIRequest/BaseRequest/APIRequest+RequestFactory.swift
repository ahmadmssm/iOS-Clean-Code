//
//  APIRequest+RequestFactory.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 03/01/2023.
//

import Get

extension APIRequest {
    
    private static func createGETRequest<T>(api: GETRequest<T>) -> Request<T> {
        let queryParams = api.queryParams.map { ($0, $1) }
        return Request(path: api.path, method: .get, query: queryParams, headers: api.headers)
    }
    
    private static func createPOSTRequest<T: Decodable>(api: POSTRequest<T>) -> Request<T> {
        let queryParams = api.queryParams.map { ($0, $1) }
        return Request(path: api.path, method: .post, query: queryParams, body: api.body, headers: api.headers)
    }
    
    static func createRequest<T>(from api: APIRequest<T>) -> Request<T>  {
        if let postRequest = api as? POSTRequest<T> {
            return self.createPOSTRequest(api: postRequest)
        }
        else {
            let getRequest = api as GETRequest<T>
            return self.createGETRequest(api: getRequest)
        }
    }
}
