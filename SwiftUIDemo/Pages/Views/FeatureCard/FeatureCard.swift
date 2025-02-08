//
//  FeatureCard.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/2/8.
//

import SwiftUI

struct FeatureCard: View {
    
    var landmark: LandMark
    
    var body: some View {
        
        landmark.featureImage?
            .resizable()
            .overlay(TextOverlay(landmark: landmark))
        
        
    }
}

struct TextOverlay: View {
    
    var landmark: LandMark
    
    var gradient: LinearGradient {
        
        .linearGradient(Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
            
            
            
        }.foregroundColor(.white)
    }
}


#Preview {
    FeatureCard(landmark: ModelData().landmarks[0])
        .aspectRatio(3/2, contentMode: .fit)
}
