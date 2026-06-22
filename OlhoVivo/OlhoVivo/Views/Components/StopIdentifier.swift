//
//  StopIdentifier.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

/// Displays the name and address of a stop served by the selected line.
///
/// See *Identificador de Ponto* in the design handoff.
struct StopIdentifier: View {
    let name: String
    let address: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(name)
                .font(
                    Font.custom("SF Pro", size: 16)
                        .weight(.medium)
                )
                .foregroundColor(Color.foregroundSecondary)
                .frame(maxWidth: .infinity, alignment: .topLeading)

            Text(address)
                .font(Font.custom("SF Pro", size: 14))
                .foregroundColor(Color.foregroundPrimary)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}

#Preview {
    StopIdentifier(name: "Term. Varginha", address: "Av. Paulo Guilger Reimberg, 13")
}
