//
//  DetailsViewModel.swift
//  LetsBrew
//
//  Created by Sergejs Smirnovs on 22.11.21.
//

import Foundation

struct DetailsViewModel {
    private let brewery: Brewery

    var imageUrl: String { brewery.imageUrl }
    var title: String { brewery.name }
    var tagline: String { brewery.tagline }
    var description: String { brewery.description }
    var brewersTips: String { brewery.brewersTips }
    var foodPairings: [String] { brewery.foodPairing }

    init(brewery: Brewery) {
        self.brewery = brewery
    }
}
