//
//  File.swift
//
//
//  Created by Sergejs Smirnovs on 20.11.21.
//

import SwiftUI

public enum Space {
    case micro
    case medium
    case gutter

    // MARK: Public

    public var value: CGFloat {
        switch self {
            case .micro: return 4
            case .medium: return 16
            case .gutter: return 16
        }
    }
}

// MARK: - ViewModifier

struct SpaceModifier: ViewModifier {
    var edges: Edge.Set
    var space: Space

    func body(content: Content) -> some View {
        content
            .padding(edges, space.value)
    }
}

public extension View {
    func padding(_ edges: Edge.Set = .all, _ space: Space) -> some View {
        modifier(SpaceModifier(edges: edges, space: space))
    }
}
