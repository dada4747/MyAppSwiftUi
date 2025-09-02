//
//  LoginUseCaseTests.swift
//  MyApp
//
//  Created by Rahul on 31/08/25.
//


import XCTest
import Combine
@testable import MyApp

final class LoginUseCaseTests: XCTestCase {
    var useCase: UserUseCase!
    var mockRepo: UserRepositoryProtocol!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockRepo = UserRepositoryImpl(service: MockUserService())
        useCase = UserUseCase(repository: mockRepo)
        cancellables = []
    }
    
    func testSuccessfulLogin() {
        let expectation = XCTestExpectation(description: "Login success")
        
        useCase.execute(email: "test@gmail.com", password: "1234")
            .sink(receiveCompletion: { _ in },
                  receiveValue: { user in
                XCTAssertEqual(user.email, "test@gmail.com")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
