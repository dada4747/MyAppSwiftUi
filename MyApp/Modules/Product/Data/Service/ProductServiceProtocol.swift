//
//  ProductServiceProtocol.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [String]
}
