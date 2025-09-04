//
//  ProductPaymentView.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


struct ProductPaymentView: View {
    @StateObject var viewModel: ProductPaymentViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Payment Screen")
                .font(.title)
            
            HStack(spacing: 40) {
                Button("Back") {
                    viewModel.goBack()
                }
                Button("Next → Success") {
                    viewModel.goToSuccess()
                }
            }
        }
        .padding()
    }
}
