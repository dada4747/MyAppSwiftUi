//
//  ProductPaymentViewModel.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


class ProductPaymentViewModel: ObservableObject {
    private let coordinator: ProductCoordinator
    
    init(coordinator: ProductCoordinator) {
        self.coordinator = coordinator
    }
    
    func goBack() {
        coordinator.goBack()
    }
    
    func goToSuccess() {
        coordinator.navigate(to: .success)
    }
    
}
