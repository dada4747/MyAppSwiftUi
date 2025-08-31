//
//  LiveUserService.swift
//  MyApp
//
//  Created by Rahul on 31/08/25.
//

import Combine
import Foundation

public final class LiveUserService: UserServiceProtocol {
    private let baseURL = URL(string: "https://api.example.com")!

    public init() {}

    public func login(email: String, password: String) -> AnyPublisher<User, Error> {
        var req = URLRequest(url: baseURL.appendingPathComponent("/auth/login"))
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["email": email, "password": password]
        req.httpBody = try? JSONEncoder().encode(body)

        return URLSession.shared.dataTaskPublisher(for: req)
            .tryMap { data, resp in
                guard let http = resp as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                // Map response to DTO then to domain User
                struct DTO: Decodable { let id: String; let name: String; let email: String }
                let dto = try JSONDecoder().decode(DTO.self, from: data)
                return User(id: dto.id, name: dto.name, email: dto.email)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    public func signup(name: String, email: String, password: String) -> AnyPublisher<User, Error> {
        // Similar to login, call /auth/signup
        Just(User(id: UUID().uuidString, name: name, email: email))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
