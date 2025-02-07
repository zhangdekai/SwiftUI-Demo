//
//  ListHomePage.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/2/7.
//

import SwiftUI

struct ListHomePage: View {
    
    private let listData:[HomeDataModel] = [
        HomeDataModel(key: 0, title: "LandMark List"),
        HomeDataModel(key: 1, title: "Badge Page"),
        HomeDataModel(key: 2, title: "响应式"),
        HomeDataModel(key: 3, title: "Hike Step"),
        
    ]
    
    var body: some View {
        VStack {
            
            CircleImage(image: Image("star_game"))
            
            Divider()
            
            List(listData, id: \.self){ item in
                
                NavigationLink {
                    
                    if(item.key == 0){
                        MapListViewPage()
                        
                    } else if(item.key == 1){
                        BadgePage()
                        
                    }else if(item.key == 2){
                        ObserveViewPage()
                        
                    }else if(item.key == 3){
                        HikeView(hike: ModelData().hikes[0])
                        
                    }
                    
                } label: {
                    HStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(Color.pink)
                        
                        Text(item.title).font(Font(.init(.label, size: 17)))
                        
                    }.padding()
                }
                
            }.listStyle(.inset)
            
        }
    }
}

#Preview {
    ListHomePage()
}
