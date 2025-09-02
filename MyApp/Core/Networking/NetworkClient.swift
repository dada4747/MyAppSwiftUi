//
//  NetworkClient.swift
//
//  Created by Rahul on 01/09/25.
//

import SwiftUI

class NetworkClient {
    private let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    func get(path: String) {
        let url = "\(baseURL)\(path)"
        print("Requesting: \(url)")
    }
}
