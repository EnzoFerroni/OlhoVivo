//
//  BusStop.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import CoreLocation

/// A bus stop served by a line (`Parada/BuscarParadasPorLinha`).
nonisolated struct BusStop: Codable, Identifiable, Hashable {
    let code: Int
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double

    var id: Int { code }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    private enum CodingKeys: String, CodingKey {
        case code = "cp"
        case name = "np"
        case address = "ed"
        case latitude = "py"
        case longitude = "px"
    }
}
