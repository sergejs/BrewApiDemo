//
//  ApiClient.swift
//  BrewApiDemo
//
//  Created by Sergejs Smirnovs on 20.11.21.
//

import HTTPClient
import ServiceContainer

public enum Environment {
    case production
    case dev
}

extension Environment {
    var hostname: String {
        switch self {
            case .production:
                return "api.punkapi.com"
            case .dev:
                return "api.punkapi.com"
        }
    }
}

private struct EnvironmentKey: InjectionKey {
    static var currentValue = Environment.production
}

public extension InjectedValues {
    var environment: Environment {
        get { Self[EnvironmentKey.self] }
        set { Self[EnvironmentKey.self] = newValue }
    }
}

public struct ApiClient {
    @Injected(\.httpClient)
    var httpClient: HTTPClientRequestDispatcher
    @Injected(\.environment)
    var environment: Environment
}

extension ApiClient {
    enum Endpoint: String {
        case list = "/v2/beers"
    }

    func makeRequest(
        method: HTTPMethod = .get,
        endpoint: Endpoint
    ) -> HTTPRequest {
        HTTPRequest(
            method: .get,
            host: environment.hostname,
            path: endpoint.rawValue
        )
    }
}

private struct ApiClientKey: InjectionKey {
    static var currentValue = ApiClient()
}

public extension InjectedValues {
    var apiClient: ApiClient {
        get { Self[ApiClientKey.self] }
        set { Self[ApiClientKey.self] = newValue }
    }
}
