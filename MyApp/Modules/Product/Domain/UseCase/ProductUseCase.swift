//
//  ProductUseCase.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI



class ProductUseCase {
    private let repository: ProductRepository
    
    init(repository: ProductRepository) { self.repository = repository }
    
    func execute() async throws -> [String] {
        try await repository.getProducts()
    }
}
