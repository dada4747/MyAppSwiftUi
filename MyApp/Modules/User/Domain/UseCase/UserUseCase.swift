//
//  LoginUseCase.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//


import Combine

public final class UserUseCase {
    private let repository: UserRepositoryProtocol
    public init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(email: String, password: String) -> AnyPublisher<User, Error> {
        repository.login(email: email, password: password)
    }
    public func executeSignup(name: String, email: String, password: String) -> AnyPublisher<User, Error> {
        repository.signup(name: name, email: email, password: password)
    }
    public func executeForgotPassword(email: String) -> Bool {
        repository.forgotPassword(email: email)
    }
}
