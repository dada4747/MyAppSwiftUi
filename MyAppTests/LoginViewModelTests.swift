//
//  LoginViewModelTests.swift
//  MyApp
//
//  Created by Rahul on 31/08/25.
//


import XCTest
import Combine
@testable import MyApp

final class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        let repo = UserRepositoryImpl(service: MockUserService())
        let useCase = LoginUseCase(repository: repo)
        viewModel = LoginViewModel(loginUseCase: useCase)
        cancellables = []
    }
    
    func testLoginUpdatesUser() {
        let expectation = XCTestExpectation(description: "Login success updates user")
        
        viewModel.email = "test@gmail.com"
        viewModel.password = "1234"
        
        viewModel.$user
            .dropFirst()
            .sink { user in
                XCTAssertEqual(user?.email, "test")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.login()
        
        wait(for: [expectation], timeout: 1.0)
    }
}
