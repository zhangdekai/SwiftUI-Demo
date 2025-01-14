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
 
 */

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            VStack{
                
                Text("Image").font(.title)
                
                CircleImage(image: Image("star_game"))
                                
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(Color.pink)
                    
                    Text("Hello World!").font(Font(.init(.label, size: 17)))
                    Spacer()
                    Text("你好")
                }.padding()
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
