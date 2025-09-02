//
//  FlightCoordinator.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class FlightCoordinator: ObservableObject {
    @ObservedObject var environment: AppEnvironment
    weak var parent: MainCoordinator?
    
    enum FlightRoute: Hashable {
        case search
        case list(searchData: [String]) // Example: pass data from search to list
        case detail(selectedFlight: String)
        case book(selectedFlight: String)
        case success
        case failed
    }
    
    @Published var path = NavigationPath()
    
    init(environment: AppEnvironment, parent: MainCoordinator?) {
        self.environment = environment
        self.parent = parent
    }
    
    func navigate(to route: FlightRoute) {
        path.append(route)
    }
    
    func goBack() {
        if !path.isEmpty { path.removeLast() }
    }
    
    func goToHome() {
        parent?.goToHome()
    }
}
