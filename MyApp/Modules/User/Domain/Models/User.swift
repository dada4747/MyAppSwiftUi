//
//  User.swift
//  MVVM_SwiftUi_Modular
//
//  Created by Rahul on 31/08/25.
//
import Foundation

public struct User: Identifiable, Codable {
    public let id: String
    public let name: String
    public let email: String
}
