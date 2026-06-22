//
//  ClearLineAlert.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

struct ClearLineAlert: View {
    @State private var isPresented = false
    var body: some View {
        Button("Present alert with actions") {
            isPresented = true
        }.alert("Deseja limpar sua seleção?", isPresented: $isPresented, actions: {
            
            Button("Cancelar") {
            }
            .keyboardShortcut(.defaultAction)
            
            
            Button("Sim", role: .destructive) {
            }
            
            //TODO: VER COMO TIRAR ESSE TERCEIRO BOTAO DE CANCEL
            
        }, message: {
            Text("Ao limpar sua seleção, você deixará de ver informações da linha atual.")
        })
    }
}

#Preview {
    ClearLineAlert()
}
