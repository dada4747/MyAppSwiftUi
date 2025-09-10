//
//  MockProductService.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI
import Combine

class MockProductService: ProductServiceProtocol {
    func fetchProducts() -> AnyPublisher<[String], Error>  {
        // Simulate network delay
        print(AppEnvironment.shared.baseURL)
//        AppEnvironment.shared.current
        return Just(["Mock Product 1", "Mock Product 2", "Mock Product 3"])
            .setFailureType(to: Error.self)
            .delay(for: .seconds(2), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
