//
//  UserCoordinator.swift
//  MyApp
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class UserModuleCoordinator: ObservableObject {
//    @ObservedObject var environment: AppEnvironment
    weak var parent: MainCoordinator?
    
    enum UserRoute: Hashable {
        case login
        case signup
        case forgot
    }
    
    @Published var path = NavigationPath()
    
    init(/*environment: AppEnvironment, */parent: MainCoordinator?) {
//        self.environment = environment
        self.parent = parent
    }
    
    func navigate(to route: UserRoute) {
        path.append(route)
    }
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func goToHome() {
        parent?.goToHome()
    }
}
