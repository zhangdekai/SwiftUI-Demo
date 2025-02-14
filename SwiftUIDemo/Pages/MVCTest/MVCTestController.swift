//
//  MVCTestController.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/2/14.
//

import Foundation

// Controller：管理 Model 和 View 交互
class UserController: ObservableObject {
    @Published var users: [UserModel] = []
    
    init() {
        self.users =  [
            UserModel(name: "Alice"),
            UserModel(name: "Bob"),
            UserModel(name: "Charlie")
        ]
    }

    func loadUsers() {
        users.append(UserModel(name: "Charlie 1"))
    }
}
