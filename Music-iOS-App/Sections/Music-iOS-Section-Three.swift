//
//  Music-iOS-Section-Three.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 10/25/24.
//

import SwiftUI

struct Music_iOS_Section_Three: View {
    let geometry: GeometryProxy
    var body: some View {
        VStack {
            Text("Level 3: Chords in a Key")
                .font(.title3)
            Text("Learn more about chord qualities and the order of chords in a key!")
                .font(.body)
                .fontWeight(.thin)
                .padding(.leading, UIScreen.main.bounds.width * (1.7 / 9))
            Text("I-IV-V")
                .foregroundColor(.red)
                .offset(x: -geometry.size.width * 0.35, y: -geometry.size.height * 0.05)
        }
        .offset(y: geometry.size.height * 0.01)
        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.13)
        .background(Color.white)
    }
}
