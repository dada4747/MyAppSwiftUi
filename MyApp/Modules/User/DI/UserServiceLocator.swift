//
//  UserServiceLocator.swift
//  MyApp
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI
class UserServiceLocator {
    static let shared = UserServiceLocator()
    
    private func makeUserUseCase(env: AppEnvironmentType) -> UserUseCase {
        let service: UserServiceProtocol
        switch env {
        case .mock:
            service = MockUserService()
        case .live:
            service = LiveUserService()
        }
        return UserUseCase(repository: UserRepositoryImpl(service: service))
    }
    
    func makeLoginView(coordinator: UserModuleCoordinator) -> some View {
        let useCase = makeUserUseCase(env: coordinator.parent?.environment.current ?? .mock)
        let viewModel = LoginViewModel(coordinator: coordinator, useCase: useCase)
        return LoginView(viewModel: viewModel)
    }
    //    func makeLoginView(coordinator: UserModuleCoordinator) -> some View {
    //        let useCase = makeUserUseCase(
    //            baseURL: coordinator.environment.baseURL,
    //            env: coordinator.environment.current
    //        )
    //        let vm = LoginViewModel(coordinator: coordinator, useCase: useCase)
    //        return LoginView(viewModel: vm)
    //    }
    //
        func makeSignupView(coordinator: UserModuleCoordinator) -> some View {
            let useCase = makeUserUseCase(
//                baseURL: coordinator.environment.baseURL,
                env: coordinator.parent?.environment.current ?? .mock
            )
            let vm = SignupViewModel(coordinator: coordinator, useCase: useCase)
            return SignupView(viewModel: vm)
        }
    
        func makeForgotView(coordinator: UserModuleCoordinator) -> some View {
            let useCase = makeUserUseCase(
//                baseURL: coordinator.environment.baseURL,
                env: coordinator.parent?.environment.current ?? .mock
            )
            let vm = ForgotViewModel(coordinator: coordinator, useCase: useCase)
            return ForgotView(viewModel: vm)
        }

}
