//
//  Zone.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

/// São Paulo zones used to colour a line's identifier badge.
enum Zone: CaseIterable {
    case central, norte, sul, leste, oeste
    case nordeste, noroeste, sudeste, sudoeste

    var color: Color {
        switch self {
        case .central: return .zonaCentral
        case .norte: return .zonaNorte
        case .sul: return .zonaSul
        case .leste: return .zonaLeste
        case .oeste: return .zonaOeste
        case .nordeste: return .zonaNordeste
        case .noroeste: return .zonaNoroeste
        case .sudeste: return .zonaSudeste
        case .sudoeste: return .zonaSudoeste
        }
    }

    /// Zone given by the first digit of the line number (its origin region).
    nonisolated static func forLineSign(_ sign: String) -> Zone {
        let firstDigit = sign.first { $0.isNumber }?.wholeNumberValue ?? 0

        switch firstDigit {
        case 1: return .central
        case 2: return .norte
        case 3: return .nordeste
        case 4: return .leste
        case 5: return .sudeste
        case 6: return .sul
        case 7: return .sudoeste
        case 8: return .oeste
        case 9: return .noroeste
        default: return .central
        }
    }
}
