//
//  Environment.swift
//  LetsBrew
//
//  Created by Sergejs Smirnovs on 24.11.21.
//

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
