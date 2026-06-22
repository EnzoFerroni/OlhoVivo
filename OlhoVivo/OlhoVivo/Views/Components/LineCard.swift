//
//  LineCard.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

/// A row describing a bus line: its ``LineIdentifier`` badge, origin and
/// destination terminals, an optional stop count, and a circular indicator.
///
/// See *Card de Linha* in the design handoff.
struct LineCard: View {
    let line: BusLine
    /// Number of stops to display. When `nil`, the count is hidden.
    var stopCount: Int?

    var body: some View {
        HStack(spacing: 8) {
            LineIdentifier(code: line.identifier, color: line.zone.color)

            VStack(spacing: 0) {
                Text(line.origin)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(line.destination)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(
                Font.custom("SF Pro", size: 16)
                    .weight(.medium)
            )
            .foregroundColor(Color.foregroundSecondary)

            VStack(spacing: 4) {
                if let stopCount {
                    Text("\(stopCount) paradas")
                        .font(Font.custom("SF Pro", size: 12))
                        .foregroundColor(Color.foregroundSecondary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                if line.circular {
                    Image(systemName: "arrow.clockwise.circle")
                        .foregroundStyle(Color.compassRed)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
    }
}

#Preview {
    LineCard(
        line: BusLine(
            code: 1234, circular: true, sign: "6913", signSuffix: 21,
            direction: 1, primaryTerminal: "Itaim Bibi", secondaryTerminal: "Term. Varginha"
        ),
        stopCount: 82
    )
    .padding()
}
