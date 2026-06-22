//
//  Zone.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

/// The geographic zones of São Paulo used to colour a line's identifier badge.
///
/// See the *Mapeamento de Zonas* section of the design handoff. Each zone maps
/// to a colour defined in the `Colors/Zones` asset catalog.
enum Zone: CaseIterable {
    case central, norte, sul, leste, oeste
    case nordeste, noroeste, sudeste, sudoeste

    /// The badge colour for this zone.
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

    /// Derives a stable zone from a line code.
    ///
    /// The Olho Vivo API does not expose a line's origin zone, so we hash the
    /// line code to keep each badge colour consistent across launches.
    // ponytail: hash-based zone; replace with a real lookup if the API ever exposes origin zone
    nonisolated static func forLineCode(_ code: Int) -> Zone {
        let zones = Zone.allCases
        return zones[abs(code) % zones.count]
    }
}
