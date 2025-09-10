//
//  NetworkClient.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI
final class NetworkClient {
    static let shared = NetworkClient()
    
    private var baseURL: String {
        AppEnvironment.shared.baseURL
    }

    private init() {}

    func request(endpoint: String) async throws -> Data {
        let urlString = "\(baseURL)/\(endpoint)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
