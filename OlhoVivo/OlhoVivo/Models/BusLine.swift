//
//  BusLine.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import Foundation

/// A bus line returned by the Olho Vivo `Linha/Buscar` endpoint.
nonisolated struct BusLine: Codable, Identifiable, Hashable {
    /// Unique line code (`cl`), used to query stops and vehicle positions.
    let code: Int
    /// Whether the line has circular behaviour (`lc`).
    let circular: Bool
    /// First part of the line sign (`lt`), e.g. `6913`.
    let sign: String
    /// Second part of the line sign (`tl`), e.g. `10`.
    let signSuffix: Int
    /// Travel direction (`sl`): `1` primary→secondary, `2` secondary→primary.
    let direction: Int
    /// Primary terminal name (`tp`).
    let primaryTerminal: String
    /// Secondary terminal name (`ts`).
    let secondaryTerminal: String

    var id: Int { code }

    /// Textual identifier shown on the badge, e.g. `6913-10`.
    var identifier: String { "\(sign)-\(signSuffix)" }

    /// The ``Zone`` whose colour fills this line's badge.
    var zone: Zone { Zone.forLineCode(code) }

    /// Origin terminal, respecting the line's ``direction``.
    var origin: String { direction == 1 ? primaryTerminal : secondaryTerminal }

    /// Destination terminal, respecting the line's ``direction``.
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
