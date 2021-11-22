//
//  ListCoordinator.swift
//  BrewApiDemo
//
//  Created by Sergejs Smirnovs on 20.11.21.
//

import SwiftUI

final class ListCoordinator: Coordinator {
    lazy var viewModel = ListViewModel(coordinator: self)
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let view = ListView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navigationController?.pushViewController(viewController, animated: false)
    }
}

extension ListCoordinator {
    func openDetails(with brewery: Brewery) {
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController, brewery: brewery)
        detailsCoordinator.start()
    }
}
