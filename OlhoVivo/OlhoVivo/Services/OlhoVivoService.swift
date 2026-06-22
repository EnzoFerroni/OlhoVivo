//
//  OlhoVivoService.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import Foundation

enum OlhoVivoError: Error {
    case missingAPIKey
    case authenticationFailed
    case requestFailed
}

/// Client for the SPTrans Olho Vivo REST API.
///
/// Login returns a session cookie that `URLSession` reuses on later requests.
/// The token comes from `Secrets.xcconfig` via the Info.plist `API` key.
actor OlhoVivoService {
    static let shared = OlhoVivoService()

    private let baseURL = URL(string: "https://api.olhovivo.sptrans.com.br/v2.1")!
    private let session: URLSession
    private var isAuthenticated = false

    init(session: URLSession = .shared) {
        self.session = session
    }

    /// Searches lines by number or terminal name.
    func searchLines(_ query: String) async throws -> [BusLine] {
        try await authenticateIfNeeded()
        return try await get("Linha/Buscar", query: ["termosBusca": query])
    }

    /// Stops served by the line.
    func stops(forLineCode code: Int) async throws -> [BusStop] {
        try await authenticateIfNeeded()
        return try await get("Parada/BuscarParadasPorLinha",
                             query: ["codigoLinha": String(code)])
    }

    /// Vehicles currently operating on the line.
    func vehicles(forLineCode code: Int) async throws -> [Vehicle] {
        try await authenticateIfNeeded()
        let positions: VehiclePositions = try await get("Posicao/Linha",
                                                        query: ["codigoLinha": String(code)])
        return positions.vehicles
    }

    // MARK: - Private

    private func authenticateIfNeeded() async throws {
        guard !isAuthenticated else { return }

        guard let key = Bundle.main.object(forInfoDictionaryKey: "API") as? String,
              !key.isEmpty else {
            throw OlhoVivoError.missingAPIKey
        }

        var request = URLRequest(url: try makeURL("Login/Autenticar",
                                                  query: ["token": key]))
        request.httpMethod = "POST"
        request.httpBody = Data() // empty body so URLSession sends Content-Length: 0 (avoids HTTP 411)

        let (data, _) = try await session.data(for: request)
        guard String(data: data, encoding: .utf8) == "true" else {
            throw OlhoVivoError.authenticationFailed
        }
        isAuthenticated = true
    }

    private func get<T: Decodable>(_ path: String, query: [String: String]) async throws -> T {
        let (data, response) = try await session.data(from: try makeURL(path, query: query))

        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw OlhoVivoError.requestFailed
        }
        return try JSONDecoder().decode(T.self, from: data)
    }

    private func makeURL(_ path: String, query: [String: String]) throws -> URL {
        var components = URLComponents(url: baseURL.appendingPathComponent(path),
                                       resolvingAgainstBaseURL: false)
        components?.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }

        guard let url = components?.url else { throw OlhoVivoError.requestFailed }
        return url
    }
}
