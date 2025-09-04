//
//  ProductDetailViewModel.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


class ProductDetailViewModel: ObservableObject {
    private let coordinator: ProductCoordinator
    let product: String
    
    init(product: String, coordinator: ProductCoordinator) {
        self.coordinator = coordinator
        self.product = product
    }
    
    func goBack() {
        coordinator.goBack()
    }
    
    func goToBuy() {
        coordinator.navigate(to: .buy(product: product))
    }
}
