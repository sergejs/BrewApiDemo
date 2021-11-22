//
//  FontWeight.swift
//
//
//  Created by Sergejs Smirnovs on 20.11.21.
//

import Foundation

public enum FontWeight {
    case regular
    case bold

    // MARK: Internal

    var fontName: String {
        switch self {
            case .regular: return "Lato-Regular"
            case .bold: return "Lato-Bold"
        }
    }
}
