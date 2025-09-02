//
//  ForgotView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

struct ForgotView: View {
    @ObservedObject var viewModel: ForgotViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Forgot")
            Button("Back") { viewModel.goBack() }
//            Button("Home") { viewModel.goToHome() }
        }
        .padding()
    }
}

