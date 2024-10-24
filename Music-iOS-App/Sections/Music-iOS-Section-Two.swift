//
//  Music-iOS-Section-Two.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 10/24/24.
//

import SwiftUI

struct Music_iOS_Section_Two: View {
    let geometry: GeometryProxy
    
    var body: some View {
        VStack {
            Text("Level 2: Building Chords")
                .font(.title3)
                .padding(.leading, UIScreen.main.bounds.width * -0.0001)
            Text("Learn how to build major, minor, and other chords!")
                .font(.body)
                .fontWeight(.thin)
                .padding(.leading, UIScreen.main.bounds.width * (1.4 / 9))
            
        }
        .padding()
        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.15)
        .background(Color.white)
    }
}
