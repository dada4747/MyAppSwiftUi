//
//  NewAppEnvironment.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class AppEnvironment: ObservableObject {
    @Published var current: AppEnvironmentType = .mock

    var baseURL: String {
        current.baseURL
    }
}
