//
//  ProductRepositoryImpl.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI
import Combine


class ProductRepositoryImpl: ProductRepository {
    private let service: ProductServiceProtocol
    init(service: ProductServiceProtocol) { self.service = service }
    
    func getProductsList() -> AnyPublisher<[String], any Error> {
        service.fetchProducts()
    }
}
