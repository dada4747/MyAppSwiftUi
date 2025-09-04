//
//  ProductNavigationView.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


struct ProductNavigationView: View {
    @ObservedObject var coordinator: ProductCoordinator
    var body: some View {
        NavigationStack(path: $coordinator.navigationStack) {
            ProductSearchView(viewModel: coordinator.makeProductSearchViewModel())
                .navigationDestination(for: ProductCoordinator.ProductRoute.self) { route in
                    switch route {
                    case .detail(let product):
                        ProductDetailView(viewModel: coordinator.makeProductDetailViewModel(product: product))
                    case .buy(let product):
                        ProductBuyView(viewModel: coordinator.makeProductBuyViewModel(product: product))
                    case .payment:
                        ProductPaymentView(viewModel: coordinator.makeProductPaymentViewModel())
                    case .success:
                        ProductSuccessView(viewModel: coordinator.makeProductSuccessViewModel())
                    }
                }
        }
    }
}
