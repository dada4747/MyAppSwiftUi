//
//  ProductSearchViewModel.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


//@MainActor
class ProductSearchViewModel: ObservableObject {
    @Published var products: [String] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let useCase: ProductUseCase
    private let coordinator: ProductCoordinator
    
    init(coordinator: ProductCoordinator, useCase: ProductUseCase) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func loadProducts() async {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        do {
            let fetchedProducts = try await useCase.execute()
            products = fetchedProducts
        } catch {
            errorMessage = error.localizedDescription
            products = []
        }
        isLoading = false
    }
    
    // View only triggers navigation via coordinator
    func showDetail(product: String) {
        coordinator.navigate(to: .detail(product: product))
    }
}
