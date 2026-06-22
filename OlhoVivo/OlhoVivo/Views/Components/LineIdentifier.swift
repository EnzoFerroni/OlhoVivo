//
//  LineIdentifier.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

struct LineIdentifier: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text("6913-10")
              .font(
                Font.custom("SF Pro", size: 16)
                  .weight(.bold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
        }
        .padding(0)
        .frame(width: 90, height: 44, alignment: .center)
        .background(Color.zonaSul)
        .cornerRadius(8)
    }
}

#Preview {
    LineIdentifier()
}
