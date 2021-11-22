//
//  ImageLoadingView.swift
//
//
//  Created by Sergejs Smirnovs on 22.11.21.
//

import LoadableImageView
import ServiceContainer
import SwiftUI

struct ImageLoadingView: View {
    @State
    private var isAnimating = true

    var body: some View {
        Image(systemName: "network")
            .imageScale(.large)
            .foregroundColor(.neutral1)
    }
}

struct ImageFailView: View {
    var body: some View {
        Image(systemName: "xmark.octagon.fill")
            .imageScale(.large)
            .foregroundColor(.red)
    }
}

private struct LoadableImagePlaceholderKey: InjectionKey {
    static var currentValue = AnyView(ImageLoadingView())
}

public extension InjectedValues {
    var loadableImagePlaceholderKey: AnyView {
        get { Self[LoadableImagePlaceholderKey.self] }
        set { Self[LoadableImagePlaceholderKey.self] = newValue }
    }
}

private struct LoadableImageFailKey: InjectionKey {
    static var currentValue = AnyView(ImageFailView())
}

public extension InjectedValues {
    var loadableImageFailKey: AnyView {
        get { Self[LoadableImageFailKey.self] }
        set { Self[LoadableImageFailKey.self] = newValue }
    }
}

public extension ImageView {
    init(
        _ url: String,
        contentMode: ContentMode = .fit
    ) {
        self.init(
            withURL: url,
            contentMode: contentMode,
            placeholderView: InjectedValues[\.loadableImagePlaceholderKey],
            failView: InjectedValues[\.loadableImageFailKey],
            httpClient: InjectedValues[\.httpClient],
            cache: InjectedValues[\.imageCache]
        )
    }
}
