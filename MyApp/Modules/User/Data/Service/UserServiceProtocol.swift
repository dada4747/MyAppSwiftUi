//
//  UserServiceProtocol.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//

import Combine

public protocol UserServiceProtocol {
    func login(email: String, password: String) -> AnyPublisher<User, Error>
    func signup(name: String, email: String, password: String) -> AnyPublisher<User, Error>
    func forgotPassword(email: String) -> Bool

}
