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
