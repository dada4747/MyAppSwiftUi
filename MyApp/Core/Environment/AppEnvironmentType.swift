import SwiftUI

// MARK: - Environment
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
