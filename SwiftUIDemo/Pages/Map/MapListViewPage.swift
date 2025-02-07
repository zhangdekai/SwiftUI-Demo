//
//  ListView.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/1/10.
//

import SwiftUI


struct MapListViewPage: View {
    
    
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks:[LandMark] {
        landMarkData.filter { landMark in
            (!showFavoritesOnly || landMark.isFavorite)
        }
        
    }
    
    var body: some View {
        
        
        List{
            
            Toggle(isOn: $showFavoritesOnly) {
                Text("Show Favorites Only ")
            }
            
            ForEach(filteredLandmarks, id: \.self) { item in
                
                // Navigation push
                NavigationLink {
                    MapDetailViewPage(landmark: item)
                } label: {
                    LandmarkRow(landmark: item)
                }
            }
        }
        .animation(.default, value: filteredLandmarks)
        .navigationBarTitle("List View")
        
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
    MapListViewPage()
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
