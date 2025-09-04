//
//  ProductSuccessViewModel.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


class ProductSuccessViewModel: ObservableObject {
    private let coordinator: ProductCoordinator
    
    init(coordinator: ProductCoordinator) {
        self.coordinator = coordinator
    }
    
    func backToHome() {
        coordinator.resetToHome()
    }
}

