//
//  ProfileHost.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/2/7.
//

import SwiftUI

struct ProfileHost: View {
    
    @State private var draftProfile = Profile.default
    @EnvironmentObject var modelData:ModelData
    @Environment(\.editMode) var editMode
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel") {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if(editMode?.wrappedValue == .inactive){
                
                
                ProfileSummary(profile: draftProfile)
                
            } else {
                
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
                
            }
            
        }
        .padding()
        
    }
}

struct HikeBadge: View {
    var name: String
    
    
    var body: some View {
        VStack(alignment: .center) {
            
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

struct ProfileSummary: View {
    @EnvironmentObject var modelData:ModelData
    
    var profile: Profile
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                Divider()
                
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    
                    HikeView(hike: modelData.hikes[0])
                }
                
            }
        }
    }
}

#Preview {
    ProfileHost().environmentObject(ModelData())
}
