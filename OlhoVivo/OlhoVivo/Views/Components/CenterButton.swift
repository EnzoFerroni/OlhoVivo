//
//  CenterButton.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

struct CenterButton: View {
    var body: some View {
        VStack {
            Image(systemName: "location")
                .foregroundStyle(Color.foregroundSecondary)
                .frame(width: 44, height: 44)
                .glassEffect(in: .rect(cornerRadius: 8))
                .font(Font.custom("SF Pro", size: 20))
        }
    }
}

#Preview {
    CenterButton()
}
