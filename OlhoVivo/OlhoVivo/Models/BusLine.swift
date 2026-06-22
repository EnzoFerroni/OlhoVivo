//
//  BusLine.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import Foundation

/// A bus line returned by the Olho Vivo `Linha/Buscar` endpoint.
nonisolated struct BusLine: Codable, Identifiable, Hashable {
    let code: Int
    let circular: Bool
    let sign: String
    let signSuffix: Int
    /// `1` primary→secondary, `2` secondary→primary.
    let direction: Int
    let primaryTerminal: String
    let secondaryTerminal: String

    var id: Int { code }

    /// Badge identifier like 6913-10.
    var identifier: String { "\(sign)-\(signSuffix)" }

    var zone: Zone { Zone.forLineSign(sign) }

    var origin: String { direction == 1 ? primaryTerminal : secondaryTerminal }

    var destination: String { direction == 1 ? secondaryTerminal : primaryTerminal }

    private enum CodingKeys: String, CodingKey {
        case code = "cl"
        case circular = "lc"
        case sign = "lt"
        case signSuffix = "tl"
        case direction = "sl"
        case primaryTerminal = "tp"
        case secondaryTerminal = "ts"
    }
}
