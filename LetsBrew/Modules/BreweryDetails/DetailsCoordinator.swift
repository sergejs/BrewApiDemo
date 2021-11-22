//
//  DetailsCoordinator.swift
//  LetsBrew
//
//  Created by Sergejs Smirnovs on 22.11.21.
//

import SwiftUI
import UIKit

final class DetailsCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    let viewModel: DetailsViewModel
    init(
        navigationController: UINavigationController?,
        brewery: Brewery
    ) {
        self.navigationController = navigationController
        viewModel = DetailsViewModel(brewery: brewery)
    }

    func start() {
        let view = DetailsView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
