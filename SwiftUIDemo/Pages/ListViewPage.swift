//
//  ListView.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/1/10.
//

import SwiftUI

/*
 
 @State private var showFavoritesOnly = false
 
 
 */

struct ListViewPage: View {
    
    //    @Environment(ModelData.self) var modelData // 17.0 upper
    
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks:[LandMark] {
        landMarkData.filter { landMark in
            (!showFavoritesOnly || landMark.isFavorite)
        }
        
        //        modelData.landMarkData.filter { landMark in
        //            (!showFavoritesOnly || landMark.isFavorite)
        //        }
    }
    
    var body: some View {
        
        if #available(iOS 16.0, *) {
            
            NavigationSplitView {
                List{
                    
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Show Favorites Only ")
                    }
                    
                    ForEach(filteredLandmarks, id: \.self) { item in
                        
                        // Navigation push
                        NavigationLink {
                            MapViewPage(landmark: item)
                        } label: {
                            LandmarkRow(landmark: item)
                        }
                    }
                }
                // Add 动画
                .animation(.default, value: filteredLandmarks)
                .navigationBarTitle("List View")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image("back_icon")
                    }
                }
            } detail: {
                // in ipad will see this detail
                Text("Select a landmark")
            }
        } else {
            
            NavigationView {
                
                List{
                    
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Show Favorites Only ")
                    }
                    
                    ForEach(filteredLandmarks, id: \.self) { item in
                        
                        // Navigation push
                        NavigationLink {
                            MapViewPage(landmark: item)
                        } label: {
                            LandmarkRow(landmark: item)
                        }
                    }
                }
                .animation(.default, value: filteredLandmarks)
                .navigationBarTitle("List View")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image("back_icon")
                    }
                }
            }
        }
        
    }
}

struct LandMarkListView : View {
    
    var body: some View {
        
        List(landMarkData, id: \.self) { item in
            
            LandmarkRow(landmark: item)
        }
        
        //        List{
        //            LandmarkRow(landmark: landMarkData[1])
        //            LandmarkRow(landmark: landMarkData[2])
        //            LandmarkRow(landmark: landMarkData[3])
        //        }
        
    }
}




#Preview("ListPage") {
    ListViewPage()
}

#Preview("List1") {
    LandmarkRow(landmark: landMarkData[1])
}

#Preview("Group") {
    Group{
        LandmarkRow(landmark: landMarkData[1])
        LandmarkRow(landmark: landMarkData[2])
        LandmarkRow(landmark: landMarkData[3])
    }
}


struct LandmarkRow: View {
    
    var landmark: LandMark
    
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if(landmark.isFavorite){
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            } else {
                Image(systemName: "star.fill")
                    .foregroundColor(.gray)
            }
        
    }.padding().background(Color.green.opacity(0.3))
}
}



struct HelloCell: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.pink)
            
            HStack {
                Text("Hello, world!").font(.title).fontWeight(.bold).multilineTextAlignment(.leading).padding(EdgeInsets.init(top: 5, leading: 0, bottom: 5, trailing: 5))
                Image(systemName: "globe")
                    .imageScale(.small)
                
            }
            
            HStack{
                
                Image(systemName: "globe")
                    .imageScale(.medium)
                Text("Desc").font(Font(.init(.label, size: 17)))
                Spacer()
                Image(systemName: "globe")
                    .imageScale(.small)
            }
        }
        .padding()
    }
}
