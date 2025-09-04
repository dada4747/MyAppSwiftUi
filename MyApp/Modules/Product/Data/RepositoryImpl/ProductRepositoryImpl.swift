//
//  ProductRepositoryImpl.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


class ProductRepositoryImpl: ProductRepository {
    private let service: ProductServiceProtocol
    init(service: ProductServiceProtocol) { self.service = service }
    
    func getProducts() async throws -> [String] {
        try await service.fetchProducts()
    }
}
