//
//  DetailsImageSheetView.swift
//  LetsBrew
//
//  Created by Sergejs Smirnovs on 22.11.21.
//

import DesignSystem
import LoadableImageView
import SwiftUI

struct DetailsImageSheetView: View {
    let imageUrl: String

    var body: some View {
        ImageView(imageUrl)
    }
}
