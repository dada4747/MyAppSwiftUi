//
//  NewAppEnvironment.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI
//struct AppEnvironment {
//    let current: AppEnvironmentType
//    let baseURL: String
//
//    static let shared = AppEnvironment(
//        current: .live,
//        baseURL: "https://api.myapp.com"
//    )
//}
////class AppEnvironment: ObservableObject {
////    @Published var current: AppEnvironmentType = .mock
////
////    var baseURL: String {
////        current.baseURL
////    }
////}
//import SwiftUI
//
//// MARK: - Environment
//enum AppEnvironmentType {
//    case mock
//    case live
//
//    var baseURL: String {
//        switch self {
//        case .mock: return "https://mock.api"
//        case .live: return "https://live.api"
//        }
//    }
//}
struct AppEnvironment {
    let current: AppEnvironmentType

    var baseURL: String {
        current.baseURL
    }

    static let shared = AppEnvironment(current: .mock)
}

enum AppEnvironmentType {
    case mock
    case live

    var baseURL: String {
        switch self {
        case .mock: return "https://mock.api"
        case .live: return "https://live.api"
        }
    }
}
