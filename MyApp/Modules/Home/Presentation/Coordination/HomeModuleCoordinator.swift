//
//  HomeModuleCoordinator.swift
//  MyApp
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI
class HomeModuleCoordinator: ObservableObject {
    enum HomeRoute {
        case bookings
        case profile
        case offers
        case sliderMenu
    }
    
    @Published var path: [HomeRoute] = []
    
    func navigate(to route: HomeRoute) {
        path.append(route)
    }
    
    func goBack() {
        if !path.isEmpty { path.removeLast() }
    }
}
