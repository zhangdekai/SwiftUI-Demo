//
//  CircleImageView.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/1/10.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.green,lineWidth: 5), alignment:.center)
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("star_game"))
}
