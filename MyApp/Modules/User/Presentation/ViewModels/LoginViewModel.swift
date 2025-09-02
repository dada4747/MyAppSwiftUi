//
//  LoginViewModel.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//

// Presentation/LoginViewModel.swift
import Combine
import Foundation

public final class LoginViewModel: ObservableObject {
    // Inputs
    @Published var coordinator: UserModuleCoordinator

    @Published public var email: String = ""
    @Published public var password: String = ""

    // Outputs
    @Published public var isLoading: Bool = false
    @Published public var user: User?
    @Published public var errorMessage: String?
    @Published public var isLoginEnabled: Bool = false

    private let loginUseCase: UserUseCase
    private var cancellables = Set<AnyCancellable>()

//    public init(loginUseCase: LoginUseCase) {
//        self.loginUseCase = loginUseCase
//        setupValidation()
//    }

    init(coordinator: UserModuleCoordinator, useCase: UserUseCase) {
        self.coordinator = coordinator
        self.loginUseCase = useCase
                setupValidation()

    }
    private func setupValidation() {
        Publishers.CombineLatest($email, $password)
            .map { email, password in
                return !email.isEmpty && password.count >= 6
            }
            .assign(to: \.isLoginEnabled, on: self)
            .store(in: &cancellables)
    }

    public func login() {
        guard isLoginEnabled else { return }
        isLoading = true
        errorMessage = nil

        loginUseCase.execute(email: email, password: password)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] user in
                self?.user = user
                self?.goToHome()
            }
            .store(in: &cancellables)
    }
    func goToSignup() { coordinator.navigate(to: .signup) }
    func goToForgot() { coordinator.navigate(to: .forgot) }
    func goToHome(){
            coordinator.goToHome()
    }
    
    
}
