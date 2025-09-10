//
//  LiveProductService.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI
import Combine


class LiveProductService: ProductServiceProtocol {
 
    private let baseURL: String
    init(baseURL: String) { self.baseURL = baseURL }
    
    func fetchProducts() -> AnyPublisher<[String], Error> {
        // Call your real API here using baseURL asynchronously
        // For demonstration, simulate network delay
        return Just(["Live Product 1", "Live Product 2", "Live Product 3"])
            .delay(for: .seconds(2), scheduler: RunLoop.main)
//            .mapError({ error in
//                return AppError.network($0)
//            })
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
enum AppError: Error {
    case network(URLError)
    case unknown
}
