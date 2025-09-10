//
//  ProductUseCase.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI
import Combine



class ProductUseCase {
    private let repository: ProductRepository
    
    init(repository: ProductRepository) { self.repository = repository }
    
    func execute() -> AnyPublisher<[String], any Error> {
        repository.getProductsList()
    }
}
