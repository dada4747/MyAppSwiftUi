//
//  ProductServiceProtocol.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI
import Combine


protocol ProductServiceProtocol {
    func fetchProducts()  -> AnyPublisher<[String], Error> 
}
