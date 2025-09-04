//
//  AppCoordinator.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class MainCoordinator: ObservableObject {
    @Published var selectedModule: MainModule = .home
    @Published var environment = AppEnvironment()
    
    enum MainModule: Hashable {
        case home
        case user
        case flight
        case product
    }
    private var container: ProductDIContainer {
           ProductDIContainer(
               environment: environment.current,
               baseURL: environment.baseURL
           )
       }
    func goToModule(_ module: MainModule) {
        selectedModule = module
    }
    
    func goToHome() {
        selectedModule = .home
    }
    // Factory methods instead of keeping lazy vars
    func makeProductCoordinator() -> ProductCoordinator {
        ProductCoordinator(parent: self, container: container)
    }
    
    func makeUserCoordinator() -> UserModuleCoordinator {
        UserModuleCoordinator( parent: self)
    }
    
    func makeFlightCoordinator() -> FlightCoordinator {
        FlightCoordinator(parent: self)
    }
    
    func makeHomeCoordinator() -> HomeModuleCoordinator {
        HomeModuleCoordinator()
    }

}
