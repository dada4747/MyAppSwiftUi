//
//  UserRepositoryImpl.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//

import Combine

public final class UserRepositoryImpl: UserRepositoryProtocol {
    private let service: UserServiceProtocol

    public init(service: UserServiceProtocol) {
        self.service = service
    }

    public func login(email: String, password: String) -> AnyPublisher<User, Error> {
        service.login(email: email, password: password)
    }

    public func signup(name: String, email: String, password: String) -> AnyPublisher<User, Error> {
        service.signup(name: name, email: email, password: password)
    }
    public func forgotPassword(email: String) -> Bool {
        service.forgotPassword(email: email)
    }

}
