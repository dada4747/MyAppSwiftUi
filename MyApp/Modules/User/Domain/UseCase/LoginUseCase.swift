//
//  LoginUseCase.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//


import Combine

public final class LoginUseCase {
    private let repository: UserRepositoryProtocol
    public init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(email: String, password: String) -> AnyPublisher<User, Error> {
        repository.login(email: email, password: password)
    }
}
