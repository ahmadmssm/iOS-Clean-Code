//
//  RestClientMocks.swift
//  DataModuleTests
//
//  Created by Ahmad Mahmoud on 03/01/2023.
//

import Mocker
import DataModule
import Foundation

// https://github.com/WeTransfer/Mocker
class RestClientMocks {
    
    private let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
//    func mockerConfig()  {
//
//        RestClientConfigParams()
//            .set(protocolClass: MockingURLProtocol.self)
//    }
    
    // Delay in seconds
    func createSuccessGetMock(endPoint: String, stausCode: Int, jsonData: Data, delay: Int = 0) {
        let url = self.createFullURL(endPoint: endPoint)
        var mock = Mock(url: url, dataType: .json, statusCode: 200, data: [.get: jsonData])
        mock.delay = DispatchTimeInterval.seconds(delay)
        mock.register()
    }
    
    // Delay in seconds
    func createFailureGetMock(endPoint: String, stausCode: Int, error: Error, delay: Int = 0) {
        let url = self.createFullURL(endPoint: endPoint)
        var mock = Mock(url: url, dataType: .json, statusCode: 200, data: [.get: Data()], requestError: error)
        mock.delay = DispatchTimeInterval.seconds(delay)
        mock.register()
    }
    
    // Delay in seconds
    func createSuccessPostMock(endPoint: String, stausCode: Int, jsonData: Data, delay: Int = 0) {
        let url = self.createFullURL(endPoint: endPoint)
        var mock = Mock(url: url, dataType: .json, statusCode: 200, data: [.post: jsonData])
        mock.delay = DispatchTimeInterval.seconds(delay)
        mock.register()
    }
    
    // Delay in seconds
    func createFailurePostMock(endPoint: String, stausCode: Int, error: Error, delay: Int = 0) {
        let url = self.createFullURL(endPoint: endPoint)
        var mock = Mock(url: url, dataType: .json, statusCode: 200, data: [.post: Data()], requestError: error)
        mock.delay = DispatchTimeInterval.seconds(delay)
        mock.register()
    }
    
    // Delay in seconds
    func createImageSuccessMock(endPoint: String, imageData: Data, delay: Int = 0) {
        let url = self.createFullURL(endPoint: endPoint)
        var mock = Mock(fileExtensions: "png", dataType: .imagePNG, statusCode: 200, data: [.get: imageData])
        mock.delay = DispatchTimeInterval.seconds(delay)
        mock.register()
    }
    
    func ignoreUrls(_ urls: [String] = []) {
        urls.map { URL(string: $0) }.compactMap { $0 }.forEach {
            Mocker.ignore($0)
        }
    }
    
    func removeAllMocks() {
        Mocker.removeAll()
    }
    
    private func createFullURL(endPoint: String) -> URL {
        let fullUrl = "\(baseURL)/\(endPoint)"
        return URL(string: fullUrl)!
    }
}
