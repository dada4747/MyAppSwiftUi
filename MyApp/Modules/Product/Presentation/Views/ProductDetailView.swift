//
//  ProductDetailView.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


struct ProductDetailView: View {
    @StateObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Product Detail: \(viewModel.product)")
                .font(.title)
            
            HStack(spacing: 40) {
                Button("Back") { viewModel.goBack() }
                Button("Next → Buy") { viewModel.goToBuy() }
            }
        }
        .padding()
    }
}
