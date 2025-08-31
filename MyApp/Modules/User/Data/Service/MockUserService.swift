//
//  MockUserService 2.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//

import Combine
import Foundation

public final class MockUserService: UserServiceProtocol {
    public var shouldSucceed = true
    public init() {}

    public func login(email: String, password: String) -> AnyPublisher<User, Error> {
        if shouldSucceed {
            let user = User(id: UUID().uuidString, name: "Mock User", email: email)
            return Just(user)
                .setFailureType(to: Error.self)
                .delay(for: .milliseconds(600), scheduler: DispatchQueue.main)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: NSError(domain: "Mock", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"]))
                .eraseToAnyPublisher()
        }
    }

    public func signup(name: String, email: String, password: String) -> AnyPublisher<User, Error> {
        let user = User(id: UUID().uuidString, name: name, email: email)
        return Just(user)
            .setFailureType(to: Error.self)
            .delay(for: .milliseconds(600), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
