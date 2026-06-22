//
//  Vehicle.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import CoreLocation

/// A vehicle currently operating on a line (`Posicao/Linha`).
nonisolated struct Vehicle: Codable, Identifiable, Hashable {
    /// Vehicle prefix/plate (`p`).
    let prefix: String
    /// Whether the vehicle is wheelchair accessible (`a`).
    let accessible: Bool
    /// Latitude (`py`).
    let latitude: Double
    /// Longitude (`px`).
    let longitude: Double

    var id: String { prefix }

    /// Map coordinate for the vehicle annotation.
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    private enum CodingKeys: String, CodingKey {
        case prefix = "p"
        case accessible = "a"
        case latitude = "py"
        case longitude = "px"
    }
}

/// Wrapper for the `Posicao/Linha` response, which nests vehicles under `vs`.
nonisolated struct VehiclePositions: Codable {
    let vehicles: [Vehicle]

    private enum CodingKeys: String, CodingKey {
        case vehicles = "vs"
    }
}
