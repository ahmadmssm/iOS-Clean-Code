//
//  CountriesAPIs.swift
//  DataModule
//
//  Created by Ahmad Mahmoud on 04/01/2023.
//

import DataModule

public struct Country: Decodable {
    let name: String
    let nativeName: String
    let region: String
}

public class Repo {
    
    private let api: CountriesAPIs
    private let restClient: RestClientProtocol
    
    init(api: CountriesAPIs, restClient: RestClientProtocol) {
        self.api = api
        self.restClient = restClient
    }
    
    public func fetchAppCountries() async throws -> [Country] {
        return try await self.restClient.invoke(api: self.api.fetchCountries())
    }
}

public class CountriesAPIs {
    
    func fetchCountries() -> API  {
        .GET(path: "all")
    }
}
