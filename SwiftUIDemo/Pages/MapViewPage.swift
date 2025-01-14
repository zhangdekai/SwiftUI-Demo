//
//  MapView.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/1/10.
//

import SwiftUI
import MapKit

struct MapViewPage: View {
    
    var landmark: LandMark
    
    var body: some View {
        
        // 17.0 upper
//        @Bindable var modelData = modelData

        ScrollView{ // List
            
            
            MapView(coordinate: landmark.locationCoordinate).frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y:-120)
                .padding(.bottom, -120)
            
            VStack(alignment: .leading){
                HStack {
                    Text(landmark.name).font(.largeTitle)
                    if(landmark.isFavorite){
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star.fill")
                            .foregroundColor(.gray)
                    }
                    
                }
                
                HStack{
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("About \(landmark.name)")
                        .font(.title)
                    Text(landmark.description)
                        .font(.subheadline)
                    
                }
                
                Spacer()
                
            }
            .padding()
            
        }.navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        
    }
    
    private var region: MKCoordinateRegion{
        
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

/// MapView

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        
        if #available(iOS 17.0, *) {
            Map(initialPosition: .region(region))
        } else {
            Map(coordinateRegion: .constant(region))
        }
        
    }
    
    private var region: MKCoordinateRegion{
        
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapViewPage(landmark: landMarkData[1])
}
