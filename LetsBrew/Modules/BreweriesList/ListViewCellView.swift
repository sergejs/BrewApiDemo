//
//  ListViewCell.swift
//  LetsBrew
//
//  Created by Sergejs Smirnovs on 22.11.21.
//

import DesignSystem
import LoadableImageView
import SwiftUI
import Utilities

struct ListViewCellView: View {
    let item: Brewery

    var body: some View {
        VStack(spacing: Space.medium.value) {
            HStack(spacing: Space.medium.value) {
                ImageView(item.imageUrl)
                    .frame(width: 50, height: 50)
                Text(item.name)
                    .textStyle(
                        .primaryText,
                        size: .bodyDefault,
                        weight: .regular
                    )
                Spacer()
                Text(item.firstBrewed)
                    .textStyle(
                        .secondaryText,
                        size: .bodySmall,
                        weight: .regular
                    )
            }
            Text(item.brewersTips)
                .textStyle(
                    .tertiaryText,
                    size: .label,
                    weight: .regular
                )
        }
    }
}
