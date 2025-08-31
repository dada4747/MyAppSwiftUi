//
//  UserRepositoryProtocol.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//

import Foundation
import Combine

public protocol UserRepositoryProtocol {
    func login(email: String, password: String) -> AnyPublisher<User, Error>
    func signup(name: String, email: String, password: String) -> AnyPublisher<User, Error>
}
