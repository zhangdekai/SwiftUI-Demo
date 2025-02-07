//
//  CategoryHomePage.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/1/23.
//

import SwiftUI

struct CategoryHomePage: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
        
            List{
                
                modelData.features[0].image.resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
        
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    
                    CategoryRow(categoryName: key, items: modelData.categories[key] ?? [])
                }
                .listRowInsets(EdgeInsets())

            }
            .navigationTitle("Featured")
        }
    }
}

#Preview {
        CategoryHomePage().environmentObject(ModelData())
    
//    let landmarks = ModelData().landMarkData
//    CategoryRow(
//        categoryName: landmarks[0].category.rawValue,
//        items: Array(landmarks.prefix(4))
//    )
}

struct CategoryRow: View {
    var categoryName: String
    var items: [LandMark]
    
    var body: some View{
        
        VStack(alignment: .leading) {
            
            Text(categoryName)
                .font(.title2)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal,showsIndicators: false) {
                
                
                HStack(alignment: .top, spacing: 0) {
                    
                    ForEach(items, id: \.self) { landmark in
                        
                        NavigationLink {
                            
                            MapDetailViewPage(landmark: landmark)
                            
                        } label: {
                            CategoryItem(landmark: landmark)
                        }

                        
                        
                        
                    }
                }
            }
            .padding(.top, 5).padding(.bottom,10)
//            .frame(height: 185)
            
        }
    }
}

struct CategoryItem: View {
    var landmark: LandMark
    
    var body: some View{
        
        VStack(alignment: .leading) {
            landmark.image.renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.black)
                .font(.callout)
        }
        .padding(.leading, 15)
    }
}

