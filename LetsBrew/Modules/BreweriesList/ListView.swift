//
//  ListView.swift
//  BrewApiDemo
//
//  Created by Sergejs Smirnovs on 20.11.21.
//

import DesignSystem
import LoadableImageView
import SwiftUI
import UIKit
import Utilities

struct ListView: View {
    @ObservedObject
    var viewModel: ListViewModel

    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        Design.setupTableViewAppearance()
    }

    var body: some View {
        listView
            .navigationBarTitle("🍻 Breweries", displayMode: .inline)
            .task {
                await viewModel.onAppear()
            }
    }

    var activityIndicator: UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.startAnimating()

        return indicator
    }

    @ViewBuilder
    var listView: some View {
        if viewModel.isLoading {
            Wrap(activityIndicator)
        } else {
            List(viewModel.items) { item in
                ListViewCellView(item: item)
                    .onTapGesture {
                        viewModel.userDidSelect(brewery: item)
                    }
            }
            .background(Color.secondaryBackground)
        }
    }
}
