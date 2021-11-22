//
//  ListApiClient.swift
//  BrewApiDemo
//
//  Created by Sergejs Smirnovs on 20.11.21.
//

import Foundation
import HTTPClient

extension ApiClient {
    func fetchList() async throws -> [Brewery] {
        let request = Request<[Brewery]>(
            underlyingRequest: makeRequest(endpoint: .list),
            decoder: JSONDecoder.breweryDecoder
        )

        return try await httpClient.request(request)
    }
}
