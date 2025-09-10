//
//  AppCoordinator.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var selectedModule: MainModule = .home
    private var environment = AppEnvironment.shared

    enum MainModule: Hashable {
        case home
        case user
        case flight
        case product
    }
    init(environment: AppEnvironment = .shared) {
        self.environment = environment
    }
    private var productContainer: ProductDIContainer {
           ProductDIContainer(
               environment: environment.current,
               baseURL: environment.baseURL
           )
       }
    private var flightContainer: FlightDIContainer {
        FlightDIContainer(
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
        ProductCoordinator(parent: self, container: productContainer)
    }
    
    func makeUserCoordinator() -> UserModuleCoordinator {
        UserModuleCoordinator( parent: self)
    }
    
    func makeFlightCoordinator() -> FlightCoordinator {
        FlightCoordinator(parent: self, container: flightContainer)
    }
    
    func makeHomeCoordinator() -> HomeModuleCoordinator {
        HomeModuleCoordinator()
    }

}
