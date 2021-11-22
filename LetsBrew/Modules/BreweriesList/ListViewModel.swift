//
//  ListViewModel.swift
//  BrewApiDemo
//
//  Created by Sergejs Smirnovs on 20.11.21.
//

import Combine
import ServiceContainer
import SwiftUI

final class ListViewModel: ObservableObject {
    @Injected(\.apiClient)
    var apiClient: ApiClient
    @Published
    var items: [Brewery] = []
    @Published
    var isLoading: Bool = false
    weak var coordinator: ListCoordinator?

    init(coordinator: ListCoordinator) {
        self.coordinator = coordinator
    }
}

// MARK: - Input

extension ListViewModel {
    @MainActor
    func onAppear() async {
        isLoading = true
        do {
            items = try await apiClient.fetchList()
            isLoading = false
        } catch {
            print(error)
        }
    }

    func userDidSelect(brewery: Brewery) {
        coordinator?.openDetails(with: brewery)
    }
}
