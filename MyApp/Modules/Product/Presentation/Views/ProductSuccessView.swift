//
//  ProductSuccessView.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


struct ProductSuccessView: View {
    @StateObject var viewModel: ProductSuccessViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Purchase Successful!")
                .font(.largeTitle)
                .foregroundColor(.green)
            
            Button("Back to Home") {
                viewModel.backToHome() // Switch module back to Home
            }
        }
        .padding()
    }
}
