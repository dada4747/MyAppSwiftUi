//
//  ProductBuyView.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


struct ProductBuyView: View {
    @StateObject var viewModel: ProductBuyViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Buy Product: \(viewModel.product)")
                .font(.title)
            
            HStack(spacing: 40) {
                Button("Back") {
                    viewModel.goBack()
                }
                Button("Next → Payment") {
                    viewModel.goToPayment()
                }
            }
        }
        .padding()
    }
}
