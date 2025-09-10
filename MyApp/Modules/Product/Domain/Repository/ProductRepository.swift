//
//  ProductRepository.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI
import Combine



protocol ProductRepository {
    func getProductsList()  -> AnyPublisher<[String], Error>
    
}
