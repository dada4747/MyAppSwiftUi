//
//  MVVM_SwiftUi_ModularApp.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//

import SwiftUI

@main
struct MyApp: App {
        @StateObject var coordinator = MainCoordinator()
    
        var body: some Scene {
            WindowGroup {
                RootView(coordinator: coordinator)
            }
        }
}
