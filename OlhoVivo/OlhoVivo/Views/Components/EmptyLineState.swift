//
//  EmptyLineState.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

/// Placeholder shown in the sheet when no line has been searched or found.
struct EmptyLineState: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "bus")
                .font(.system(size: 32))
                .foregroundColor(Color.foregroundSecondary)

            Text("Nenhuma Linha Encontrada")
                .font(
                    Font.custom("SF Pro", size: 16)
                        .weight(.medium)
                )
                .foregroundColor(Color.foregroundSecondary)

            Text("Pesquise alguma linha ou destino de seu ônibus")
                .font(Font.custom("SF Pro", size: 14))
                .foregroundColor(Color.foregroundPrimary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 40)
    }
}

#Preview {
    EmptyLineState()
}
