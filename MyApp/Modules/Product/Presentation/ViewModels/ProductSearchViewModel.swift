//
//  ProductSearchViewModel.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI
import Combine


//@MainActor
class ProductSearchViewModel: ObservableObject {
    @Published var products: [String] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    private var cancellables = Set<AnyCancellable>()

    private let useCase: ProductUseCase
    private let coordinator: ProductCoordinator
    
    init(coordinator: ProductCoordinator, useCase: ProductUseCase) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func loadProducts()  {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        
        useCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case.failure(let error): self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: {  [weak self] products in
                self?.products = products
            }.store(in: &cancellables)
        
    }
    
    // View only triggers navigation via coordinator
    func showDetail(product: String) {
        coordinator.navigate(to: .detail(product: product))
    }
}
