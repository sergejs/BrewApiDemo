//
//  BreweryDecoder.swift
//  LetsBrew
//
//  Created by Sergejs Smirnovs on 21.11.21.
//

import Foundation

extension JSONDecoder {
    static var breweryDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return decoder
    }
}
