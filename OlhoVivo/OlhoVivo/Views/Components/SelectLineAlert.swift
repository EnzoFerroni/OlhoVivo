//
//  SelectLineAlert.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

struct SelectLineAlert: View {
    @State private var isPresented = false
    var body: some View {
        Button("Present alert with actions") {
            isPresented = true
        }.alert("Deseja selecionar essa linha?", isPresented: $isPresented, actions: {
            Button("Não") {
            }
            
            Button("Sim") {
            }
            .keyboardShortcut(.defaultAction)
            
            
            
        }, message: {
            Text("Ao seleciona-la, você verá a posição dos pontos e os ônibus em operação no mapa.")
        })
    }
}

#Preview {
    SelectLineAlert()
}
