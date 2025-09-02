//
//  SignupView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel: SignupViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Signup")
            Button("Back") { viewModel.goBack() }
//            Button("Home") { viewModel.goToHome() }
        }
        .padding()
    }
}

