//
//  Music-iOS.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 10/23/24.
//

import SwiftUI

struct Music_iOS: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 20) {
                        Spacer()
                        VStack {
                            Text("Level 1: Chords")
                                .font(.title2)
                            Text("Learn about what chords are in a key and what key a song is by the chord progression!")
                                .font(.body)
                                .fontWeight(.thin)
                        }
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.15)
                        .background(Color.white)
                        
                        VStack {
                            Text("Level 2: Scales")
                                .font(.title2)
                            Text("Learn about scale formulas for the major scale, major pentatonic scale, the major scale modes and more!")
                                .font(.body)
                                .fontWeight(.thin)
                        }
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.15)
                        .background(Color.white)
                        
                        VStack {
                            Text("Level 3: Building Chords")
                                .font(.title2)
                            Text("Learn about how chords are built from intervals and their relationship to scales!")
                                .font(.body)
                                .fontWeight(.thin)
                        }
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.15)
                        .background(Color.white)
                        
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
    }
}

#Preview {
    Music_iOS()
}