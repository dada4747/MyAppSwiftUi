//
//  MockProductService.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI
import SwiftUI

class MockProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [String] {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 300_000_000)
        return ["Mock Product 1", "Mock Product 2", "Mock Product 3"]
    }
}
