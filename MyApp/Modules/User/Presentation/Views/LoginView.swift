//
//  LoginView.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//


// Presentation/LoginView.swift
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: 16) {
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            Button(action: viewModel.login) {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Login")
                        .bold()
                }
            }
            .disabled(!viewModel.isLoginEnabled)
            .buttonStyle(.borderedProminent)

            if let user = viewModel.user {
                Text("Welcome, \(user.name)")
                    .foregroundColor(.green)
            }

            if let err = viewModel.errorMessage {
                Text(err).foregroundColor(.red)
            }
        }
        .padding()
    }
}
#Preview{
    ServiceLocator.shared.makeLoginView()
}
