//
//  ProductSearchView.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


struct ProductSearchView: View {
    @StateObject var viewModel: ProductSearchViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Product Search")
            
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else {
                List(viewModel.products, id: \.self) { product in
                    Button(product) {
                        viewModel.showDetail(product: product)
                    }
                }
            }
        }
        .task {
            await viewModel.loadProducts()
        }
    }
}
