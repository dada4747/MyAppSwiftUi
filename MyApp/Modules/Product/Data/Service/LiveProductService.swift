//
//  LiveProductService.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


class LiveProductService: ProductServiceProtocol {
    private let baseURL: String
    init(baseURL: String) { self.baseURL = baseURL }
    
    func fetchProducts() async throws -> [String] {
        // Call your real API here using baseURL asynchronously
        // For demonstration, simulate network delay
        try await Task.sleep(nanoseconds: 500_000_000)
        return ["Live Product 1", "Live Product 2", "Live Product 3"]
    }
}
