//
//  MVCTestView.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/2/14.
//

import SwiftUI

/// MVC Mode 

// View：展示 UI
struct MVCTestView: View {
    @ObservedObject var controller = UserController()

    var body: some View {
        VStack {
            List(controller.users) { user in
                Text(user.name)
            }
            Button("加载用户") {
                controller.loadUsers()
            }
        }.navigationTitle("MVC Mode")
    }
}


#Preview {
    MVCTestView()
}
