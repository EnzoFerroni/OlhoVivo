//
//  MapViewModel.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import Combine
import MapKit
import SwiftUI

/// Drives the map screen: searching lines, selecting one, and loading its
/// stops and operating vehicles from the Olho Vivo API.
@MainActor
final class MapViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchResults: [BusLine] = []
    @Published var selectedLine: BusLine?
    @Published var stops: [BusStop] = []
    @Published var vehicles: [Vehicle] = []
    @Published var isLoading = false
    @Published var cameraPosition: MapCameraPosition = .automatic

    private let service: OlhoVivoService

    init(service: OlhoVivoService = .shared) {
        self.service = service
    }

    /// Searches lines matching ``searchText``. Clears results for empty input.
    func search() async {
        let query = searchText.trimmingCharacters(in: .whitespaces)
        guard !query.isEmpty else {
            searchResults = []
            return
        }

        isLoading = true
        defer { isLoading = false }

        searchResults = (try? await service.searchLines(query)) ?? []
    }

    /// Selects a line, loading its stops and vehicles and framing them on the map.
    func select(_ line: BusLine) async {
        isLoading = true
        defer { isLoading = false }

        selectedLine = line
        searchResults = []
        searchText = ""

        async let stops = service.stops(forLineCode: line.code)
        async let vehicles = service.vehicles(forLineCode: line.code)

        self.stops = (try? await stops) ?? []
        self.vehicles = (try? await vehicles) ?? []

        frameStops()
    }

    /// Clears the current selection and returns to the search state.
    func clearSelection() {
        selectedLine = nil
        stops = []
        vehicles = []
        cameraPosition = .automatic
    }

    /// Centres the camera back on the user's location.
    func recenter() {
        cameraPosition = .userLocation(fallback: .automatic)
    }

    private func frameStops() {
        let coordinates = stops.map(\.coordinate)
        guard let region = MKCoordinateRegion(fitting: coordinates) else { return }
        cameraPosition = .region(region)
    }
}

private extension MKCoordinateRegion {
    /// Builds a region that fits all the given coordinates, with some padding.
    init?(fitting coordinates: [CLLocationCoordinate2D]) {
        guard let first = coordinates.first else { return nil }

        var minLat = first.latitude, maxLat = first.latitude
        var minLon = first.longitude, maxLon = first.longitude

        for coordinate in coordinates {
            minLat = min(minLat, coordinate.latitude)
            maxLat = max(maxLat, coordinate.latitude)
            minLon = min(minLon, coordinate.longitude)
            maxLon = max(maxLon, coordinate.longitude)
        }

        let center = CLLocationCoordinate2D(
            latitude: (minLat + maxLat) / 2,
            longitude: (minLon + maxLon) / 2
        )
        let span = MKCoordinateSpan(
            latitudeDelta: (maxLat - minLat) * 1.3 + 0.01,
            longitudeDelta: (maxLon - minLon) * 1.3 + 0.01
        )
        self.init(center: center, span: span)
    }
}
