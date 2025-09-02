//
//  UserNavigationView.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI
import SwiftUI

struct UserNavigationView: View {
    @StateObject var coordinator: UserModuleCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            UserServiceLocator.shared.makeLoginView(coordinator: coordinator)
                .navigationDestination(for: UserModuleCoordinator.UserRoute.self) { route in
                    switch route {
                    case .login:
                        UserServiceLocator.shared.makeLoginView(coordinator: coordinator)
                    case .signup:
                        UserServiceLocator.shared.makeSignupView(coordinator: coordinator)
                    case .forgot:
                        UserServiceLocator.shared.makeForgotView(coordinator: coordinator)
                    }
                }
        }
    }
}
