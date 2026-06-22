//
//  MapView.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI
import MapKit

/// Root screen: a full-screen map with the line sheet on top.
///
/// When a line is selected, its stops and vehicles are drawn as annotations
/// and a clear button lets the user dismiss the selection.
struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var locationManager = CLLocationManager()
    @State private var showClearAlert = false

    var body: some View {
        Map(position: $viewModel.cameraPosition) {
            UserAnnotation()

            ForEach(viewModel.stops) { stop in
                Annotation(stop.name, coordinate: stop.coordinate) {
                    Circle()
                        .fill(.white)
                        .stroke(Color.foregroundSecondary, lineWidth: 3)
                        .frame(width: 14, height: 14)
                }
            }

            ForEach(viewModel.vehicles) { vehicle in
                Annotation(vehicle.prefix, coordinate: vehicle.coordinate) {
                    Image(systemName: "bus.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(Color.compassRed, in: .circle)
                }
            }
        }
        .ignoresSafeArea()
        .overlay(alignment: .topTrailing) {
            Button { viewModel.recenter() } label: {
                CenterButton()
            }
            .buttonStyle(.plain)
            .padding(.trailing, 16)
            .padding(.top, 8)
        }
        .overlay(alignment: .bottomLeading) {
            if viewModel.selectedLine != nil {
                Button { showClearAlert = true } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color.foregroundSecondary)
                        .frame(width: 44, height: 44)
                        .glassEffect(in: .rect(cornerRadius: 8))
                }
                .buttonStyle(.plain)
                .padding(.leading, 16)
                .padding(.bottom, 210)
            }
        }
        .sheet(isPresented: .constant(true)) {
            SheetView(viewModel: viewModel)
        }
        .alert("Deseja limpar sua seleção?", isPresented: $showClearAlert) {
            Button("Cancelar", role: .cancel) {}
            Button("Sim", role: .destructive) {
                viewModel.clearSelection()
            }
        } message: {
            Text("Ao limpar sua seleção, você deixará de ver informações da linha atual.")
        }
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    MapView()
}
