//
//  Vehicle.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import CoreLocation

/// A vehicle currently operating on a line (`Posicao/Linha`).
nonisolated struct Vehicle: Codable, Identifiable, Hashable {
    let prefix: String
    let accessible: Bool
    let latitude: Double
    let longitude: Double

    var id: String { prefix }

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

/// `Posicao/Linha` response, nesting vehicles under `vs`.
nonisolated struct VehiclePositions: Codable {
    let vehicles: [Vehicle]

    private enum CodingKeys: String, CodingKey {
        case vehicles = "vs"
    }
}
