//
//  StopIdentifier.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

struct StopIdentifier: View {
    var body: some View {
        VStack{
            Text("Term. Varginha")
              .font(
                Font.custom("SF Pro", size: 16)
                  .weight(.medium)
              )
              .foregroundColor(Color.foregroundSecondary)
              .frame(maxWidth: .infinity, alignment: .topLeading)
            
            Text("Av. Paulo Guilger Reimberg, 13")
              .font(Font.custom("SF Pro", size: 14))
              .foregroundColor(Color.foregroundPrimary)
              .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}

#Preview {
    StopIdentifier()
}
