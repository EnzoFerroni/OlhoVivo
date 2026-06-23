//
//  MapView.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI
import MapKit

/// Root screen: full-screen map with the line sheet on top.
struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var locationManager = CLLocationManager()

    var body: some View {
        Map(position: $viewModel.cameraPosition) {
            UserAnnotation()

            ForEach(viewModel.stops) { stop in
                Annotation("", coordinate: stop.coordinate) {
                    Image(systemName: "signpost.right.and.left")
                        .font(.system(size: 14))
                        .foregroundStyle(.foregroundWhite)
                        .padding(8)
                        .background(Color.foregroundSecondary, in: .circle)
                }
            }

            ForEach(viewModel.vehicles) { vehicle in
                Annotation("", coordinate: vehicle.coordinate) {
                    Image(systemName: "bus.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(.foregroundSecondary)
                        .padding(8)
                        .background(Color.foregroundWhite, in: .circle)
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
        .sheet(isPresented: .constant(true)) {
            SheetView(viewModel: viewModel)
        }
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    MapView()
}
