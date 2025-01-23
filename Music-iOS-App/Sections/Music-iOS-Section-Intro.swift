//
//  Music-iOS-Section-Intro.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 10/25/24.
//

import SwiftUI

struct Music_iOS_Section_Intro: View {
    let geometry: GeometryProxy
    
    var body: some View {
        VStack {
            Text("Welcome to Beginner Music Theory")
                .foregroundColor(.white)
                .font(.title2)
                .offset(y: -geometry.size.height * 0.005)
            Text("Learn about the basics of music theory, by learning intervals, scales, and chords!")
                .foregroundColor(.white)
                .font(.body)
        }
        .offset(y: geometry.size.height * 0.01)
        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.16)
        .background(Color.blue)
    }
}
