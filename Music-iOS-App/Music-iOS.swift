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
                            Text("Level 1: Intervals and scales")
                                .font(.title3)
                                .padding(.leading, UIScreen.main.bounds.width * (1 / 9))
                            Text("Learn about the building blocks of music and how they build scales!")
                                .font(.body)
                                .fontWeight(.thin)
                                .padding(.leading, UIScreen.main.bounds.width * (1 / 9))
                        }
                        .overlay(
                            ZStack {
                                // First green circle with "do"
                                ZStack {
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                                    Text("do")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                }
                                .offset(x: -geometry.size.width * 0.35)
                                .offset(y: geometry.size.height * 0.055)

                                // Second blue circle with "re" above the first circle
                                ZStack {
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                                    Text("re")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                }
                                .offset(x: -geometry.size.width * 0.35, y: -geometry.size.height * 0.001) // Positioned above the first circle
                                
                                ZStack {
                                    Circle()
                                        .fill(Color.purple)
                                        .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                                    Text("mi")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                }
                                .offset(x: -geometry.size.width * 0.35, y: -geometry.size.height * 0.055) // Positioned above the first circle
                            }
                        )
                        .padding()
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.175)
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
