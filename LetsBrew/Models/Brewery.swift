//
//  Brewery.swift
//  BrewApiDemo
//
//  Created by Sergejs Smirnovs on 20.11.21.
//

import Foundation

struct Brewery: Codable, Identifiable {
    let id: Int
    let name: String
    let tagline: String
    let description: String
    let imageUrl: String
    let firstBrewed: String
    let foodPairing: [String]
    let brewersTips: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case description
        case imageUrl
        case firstBrewed
        case foodPairing
        case brewersTips
    }
}
