//
//  File.swift
//
//
//  Created by Sergejs Smirnovs on 20.11.21.
//

import Foundation

public enum FontSize: Int {
    case title = 20
    case bodyDefault = 16
    case bodySmall = 14
    case label = 12
    case labelSmall = 11

    // MARK: Internal

    var lineSpacing: Float {
        switch self {
            case .bodyDefault, .title: return 4
            case .bodySmall: return 3
            case .label: return 2
            case .labelSmall: return 0.5
        }
    }
}
