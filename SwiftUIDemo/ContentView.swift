//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/1/10.
//

import SwiftUI

/*
 
 Apple 官方教程 link： https://developer.apple.com/tutorials/swiftui/creating-and-combining-views
 
 // 快捷方式
 1: Preview 中 第2个箭头（Selectable Mode），cmd+ctl 选中item 可以添加 Wrap 或设置 属性
 2: like Text, 选中后，ctl + 点击，会弹出设置框  -> Show SwiftUI Inspector 设置
 3:  Xcode 右上角 + 可Add new View
 
 4:  #Preview("ListPage") {
        ListViewPage()
    }
 5. NavigationView ：确保只有最外层的页面包含 NavigationView，而子页面不需要再嵌套一个新的 NavigationView。
 
 */

struct ContentView: View {
    
    enum Tab {
        case featured
        case list
    }
    
    
    
    @State private var selection: Tab = .featured
    
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        
        NavigationView {
            
            TabView {
                
                
                CategoryHomePage(modelData: _modelData)
                    .tabItem {
                        Label("Featured", systemImage: "star")
                    }
                    .tag(Tab.featured)
                
                
                ListHomePage().tabItem {
                    Label("List", systemImage: "list.bullet")
                    
                }.tag(Tab.list)
                
                
                
            }
            .navigationBarHidden(true)
            .navigationTitle("Swift UI")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image("back_icon")
                }
            }
        }
        
        
    }
}

#Preview {
    ContentView().environmentObject(ModelData())
}
