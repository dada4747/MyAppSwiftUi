//
//  AppDIContainer.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI

struct ProductDIContainer {
    let environment: AppEnvironmentType
    let baseURL: String

    func makeProductUseCase() -> ProductUseCase {
        let service: ProductServiceProtocol = (environment == .mock)
            ? MockProductService()
            : LiveProductService(baseURL: baseURL)

        return ProductUseCase(repository: ProductRepositoryImpl(service: service))
    }
}
