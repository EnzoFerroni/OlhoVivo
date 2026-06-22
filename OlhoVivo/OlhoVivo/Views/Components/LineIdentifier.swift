//
//  LineIdentifier.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

/// Line identifier badge, filled with the zone colour.
struct LineIdentifier: View {
    let code: String
    let color: Color

    var body: some View {
        Text(code)
            .font(
                Font.custom("SF Pro", size: 16)
                    .weight(.bold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .frame(width: 72, height: 44, alignment: .center)
            .background(color)
            .cornerRadius(8)
    }
}

#Preview {
    LineIdentifier(code: "6913-10", color: .zonaSul)
}
