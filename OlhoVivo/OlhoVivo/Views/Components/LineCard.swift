//
//  LineCard.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

struct LineCard: View {
    var body: some View {
        HStack(spacing: 8){
            LineIdentifier()
            
            VStack{
                Text("Itaim Bibi")
                    .font(
                        Font.custom("SF Pro", size: 16)
                            .weight(.medium)
                    )
                    .foregroundColor(Color.foregroundSecondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Term. Varginha")
                    .font(
                        Font.custom("SF Pro", size: 16)
                            .weight(.medium)
                    )
                    .foregroundColor(Color.foregroundSecondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack{
                Text("82 paradas")
                    .font(Font.custom("SF Pro", size: 12))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color.foregroundSecondary)
                    .frame(maxWidth: .infinity, minHeight: 25, maxHeight: 25, alignment: .trailing)
                
                Image(systemName: "arrow.clockwise.circle")
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: .infinity, minHeight: 15, maxHeight: 15, alignment: .trailing)
                    .foregroundStyle(Color.compassRed)
            }
        }
    }
}

#Preview {
    LineCard()
}
