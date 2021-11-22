//
//  DetailsView.swift
//  LetsBrew
//
//  Created by Sergejs Smirnovs on 22.11.21.
//

import DesignSystem
import LoadableImageView
import SwiftUI

struct DetailsView: View {
    let viewModel: DetailsViewModel
    @State
    private var showingImage = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.title)
                    .textStyle(
                        .primaryText,
                        size: .title,
                        weight: .regular
                    )
                    .padding(.bottom, .medium)
                ImageView(viewModel.imageUrl)
                    .frame(maxHeight: 250)
                    .padding(.bottom, .medium)
                    .onTapGesture {
                        showingImage.toggle()
                    }
                Text(viewModel.description)
                    .textStyle(
                        .secondaryText,
                        size: .bodyDefault,
                        weight: .regular
                    )
                    .padding(.bottom, .medium)
                Text("Tagline: ")
                    .textStyle(
                        .primaryText,
                        size: .bodyDefault,
                        weight: .bold
                    )
                Text(viewModel.tagline)
                    .textStyle(
                        .secondaryText,
                        size: .bodyDefault,
                        weight: .regular
                    )
                    .padding(.bottom, .medium)
                Text("Brewers Tips: ")
                    .textStyle(
                        .primaryText,
                        size: .bodyDefault,
                        weight: .bold
                    )
                Text(viewModel.brewersTips)
                    .textStyle(
                        .secondaryText,
                        size: .bodyDefault,
                        weight: .regular
                    )
                    .padding(.bottom, .medium)
                Text("Food pairings: ")
                    .textStyle(
                        .primaryText,
                        size: .bodyDefault,
                        weight: .bold
                    )
                foorParigings
            }
            .padding(.horizontal, .gutter)
        }
        .background(Color.primaryBackground)
        .sheet(isPresented: $showingImage) {
            DetailsImageSheetView(imageUrl: viewModel.imageUrl)
        }
    }

    @ViewBuilder
    var foorParigings: some View {
        ForEach(viewModel.foodPairings, id: \.self) { foodPairing in
            Text("- \(foodPairing)")
                .textStyle(
                    .secondaryText,
                    size: .bodyDefault,
                    weight: .regular
                )
        }
    }
}
