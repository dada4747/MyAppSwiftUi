//
//  ServiceLocator.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//

import SwiftUI

public enum AppEnvironment {
    case mock
    case live
}

public final class ServiceLocator {
    public static let shared = ServiceLocator(environment: .live) // default
    private var environment: AppEnvironment

    public init(environment: AppEnvironment) {
        self.environment = environment
    }

    public func setEnvironment(_ env: AppEnvironment) {
        self.environment = env
    }

    // MARK: - Services (factory)
    private func makeUserService() -> UserServiceProtocol {
        switch environment {
        case .mock: return MockUserService()
        case .live: return LiveUserService()
        }
    }

    private func makeUserRepository() -> UserRepositoryProtocol {
        UserRepositoryImpl(service: makeUserService())
    }

    private func makeLoginUseCase() -> LoginUseCase {
        LoginUseCase(repository: makeUserRepository())
    }

    // MARK: - View builders
    public func makeLoginView() -> some View {
        let vm = LoginViewModel(loginUseCase: makeLoginUseCase())
        return LoginView(viewModel: vm)
    }

}
