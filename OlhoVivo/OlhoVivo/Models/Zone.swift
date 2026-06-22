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

    /// Stable zone for a line code (the API does not expose the origin zone).
    nonisolated static func forLineCode(_ code: Int) -> Zone {
        let zones = Zone.allCases
        return zones[abs(code) % zones.count]
    }
}
