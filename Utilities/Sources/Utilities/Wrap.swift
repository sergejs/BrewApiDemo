import SwiftUI

public struct Wrap<Wrapped: UIView>: UIViewRepresentable {
    public init(
        _ makeView: @escaping @autoclosure () -> Wrapped,
        updater update: @escaping Updater
    ) {
        self.makeView = makeView
        self.update = update
    }

    // MARK: Public

    public typealias Updater = (Wrapped, Context) -> Void

    public func makeUIView(context: Context) -> Wrapped {
        makeView()
    }

    public func updateUIView(_ view: Wrapped, context: Context) {
        update(view, context)
    }

    private var makeView: () -> Wrapped
    private var update: (Wrapped, Context) -> Void
}

public extension Wrap {
    init(
        _ makeView: @escaping @autoclosure () -> Wrapped,
        updater update: @escaping (Wrapped) -> Void
    ) {
        self.makeView = makeView
        self.update = { view, _ in update(view) }
    }

    init(_ makeView: @escaping @autoclosure () -> Wrapped) {
        self.makeView = makeView
        update = { _, _ in }
    }
}
