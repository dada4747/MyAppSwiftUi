//
//  AppCoordinator.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class MainCoordinator: ObservableObject {
    @Published var selectedModule: MainModule = .home
    @Published var environment = AppEnvironment()
//    lazy var userModuleCoordinator: UserCoordinator = UserCoordinator(environment: environment, parent: self)
    
    lazy var homeCoordinator: HomeModuleCoordinator = HomeModuleCoordinator()
    lazy var userCoordinator: UserModuleCoordinator = UserModuleCoordinator(environment: environment, parent: self)
    lazy var flightCoordinator: FlightCoordinator = FlightCoordinator(environment: environment, parent: self)
    
    enum MainModule: Hashable {
        case home
        case user
        case flight
    }
    
    func goToModule(_ module: MainModule) {
        selectedModule = module
    }
    
    func goToHome() {
        selectedModule = .home
    }
}
