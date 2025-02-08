//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/1/10.
//

import SwiftUI

@main /// SwiftUI 应用程序的入口
struct SwiftUIDemoApp: App {
    
    @StateObject private var modelData = ModelData()
    
    
    var body: some Scene {
        
#if os(iOS)
        
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
        
#elseif os(macOS)
        
        WindowGroup {
            AlternativeContentView()
        }
        
        Settings {
            SettingsView()
        }
#endif
    }
}
