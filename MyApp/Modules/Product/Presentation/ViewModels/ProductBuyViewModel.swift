//
//  ProductBuyViewModel.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


class ProductBuyViewModel: ObservableObject {
    private let coordinator: ProductCoordinator
    let product: String
    
    init(product: String, coordinator: ProductCoordinator) {
        self.coordinator = coordinator
        self.product = product
    }
    
    func goBack() {
        coordinator.goBack()
    }
    
    func goToPayment() {
        coordinator.navigate(to: .payment)
    }
}
