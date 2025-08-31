//
//  MVVM_SwiftUi_ModularApp.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//

import SwiftUI

@main
struct MyApp: App {
    init() {
           // Set environment once at app launch
           ServiceLocator.shared.setEnvironment(.mock)
       }
    var body: some Scene {
        WindowGroup {
            ServiceLocator.shared.makeLoginView()
        }
    }
}
