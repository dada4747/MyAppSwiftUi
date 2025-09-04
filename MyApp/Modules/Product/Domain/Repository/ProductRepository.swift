//
//  ProductRepository.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI



protocol ProductRepository {
    func getProducts() async throws -> [String]
}
