//
//  ObserveViewPage.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/1/15.
//

import SwiftUI
/*
 
 
 1. 使用 @State 管理视图内部状态
 @State 属性用于存储视图内部的状态，并在状态改变时自动触发视图刷新。
 
 2. 使用 @Binding 共享状态 @Binding 用于在父视图和子视图之间共享状态。
 
 3. 使用 @ObservedObject 管理复杂数据模型
 @ObservedObject 用于将外部数据模型与视图绑定，并在模型发生变化时更新视图。
 
 4. 使用 @EnvironmentObject 在视图树中共享数据，无需显式传递。
 
 5. 结合 Combine 实现响应式流

 
 
 */

struct ObserveViewPage: View {
    
    @State private var count = 0;
    
    
    @StateObject var environmentModel = CounterModel()
    
    var body: some View {
        ScrollView{
            
            VStack{
                Text("@State : 适用于单个视图的简单状态管理")
                Text("Current count = \(count)").padding()
                Button("Add + 1") {
                    count += 1
                }
            }.padding().background(Color.yellow.opacity(0.4))
            
            
            VStack{
                Text("@Binding : 适用于父子视图之间的双向数据绑定")
                ParentView().padding()
            }.padding().background(Color.green.opacity(0.4))
            
            
            
            ObserveTestView()
            
            
            EnvironmentView().environmentObject(environmentModel)
            
            TimerView().padding().background(Color.red.opacity(0.3))
            
            
            Color.gray.opacity(0.3).frame(height: 200)
            
                        
            
        }.navigationTitle("响应式")
        
        
    }
}

#Preview {
    ObserveViewPage()
}

struct ObserveTestView: View {
    
    @ObservedObject var counterModel = CounterModel()

    var body: some View{
        
        VStack{
            Text("@ObservedObject 管理复杂数据模型 \n\n@ObservedObject : 用于将外部数据模型与视图绑定，并在模型发生变化时更新视图 \n使用 @Published 标记的数据属性会触发视图更新。")
            
            Text("Current count = \(counterModel.count)").padding()
            
            Button("Add + 2"){
                
                counterModel.count += 2
            }
            
            Button("Change Color"){
                
                let op = Double.random(in: 1...50) / 100.0
                
                counterModel.color = Color.red.opacity(op)
            }
            
        }.padding().background(counterModel.color)
    }
}


struct EnvironmentView: View {
    
    @EnvironmentObject var counterModel: CounterModel
    
    var body: some View{
        
        VStack{
            Text("@EnvironmentObject 在视图树中共享数据，无需显式传递。适合在多个视图中共享数据,通过 @EnvironmentObject 自动获取父视图提供的数据")
            
            Text("Current count = \(counterModel.count)").padding()
            
            Button("Add + 2"){
                
                counterModel.count += 2
            }
            
            Button("Change Color"){
                
                let op = Double.random(in: 1...50) / 100.0
                
                counterModel.color = Color.pink.opacity(op)
            }
            
        }.padding().background(counterModel.color)
    }
}



/// ObservableObject
/* @Published 是 SwiftUI 和 Combine 框架中的一个属性包装器，它的作用是：

✅ 自动发布（通知）视图更新，当属性值发生变化时，所有观察它的 SwiftUI 视图都会自动刷新。
 
 @Published 背后的原理
 实际上，@Published 本质上是一个 Combine 的 Publisher，可以手动监听它的变化：

 
 */

class CounterModel: ObservableObject {
    @Published var count:Int = 0
    @Published var color:Color = .green.opacity(0.5)
    
}

struct ParentView: View {
    @State private var isOn = false
    
    var body: some View {
        ToggleView(isOn: $isOn)
    }
}

struct ToggleView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("Toggle", isOn: $isOn)
    }
}


import Combine

class TimerModel: ObservableObject {
    @Published var time = 0
    private var timer: AnyCancellable?

    func start() {
        timer = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.time += 1
            }
    }

    func stop() {
        timer?.cancel()
    }
}

struct TimerView: View {
    @ObservedObject var model = TimerModel()

    var body: some View {
        VStack {
            Text("Time: \(model.time)")
            Button("Start") {
                model.start()
            }
            Button("Stop") {
                model.stop()
            }
        }
    }
}

