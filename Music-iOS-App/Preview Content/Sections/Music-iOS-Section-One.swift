// Music-iOS-Section-One.swift
import SwiftUI

struct MusicIOSSectionOne: View {
    let geometry: GeometryProxy
    
    var body: some View {
        VStack(spacing: 20) {
            MusicContentView(
                title: "Level 1: Intervals and Scales",
                description: "Learn about the building blocks of music and how they build scales"
            )
            .overlay(
                ZStack {
                    createCircleOverlay(
                        color: .green,
                        text: "do",
                        width: geometry.size.width * 0.1,
                        height: geometry.size.height * 0.1,
                        xOffset: -geometry.size.width * 0.35,
                        yOffset: geometry.size.height * 0.055
                    )

                    createCircleOverlay(
                        color: .blue,
                        text: "re",
                        width: geometry.size.width * 0.1,
                        height: geometry.size.height * 0.1,
                        xOffset: -geometry.size.width * 0.35,
                        yOffset: -geometry.size.height * 0.001
                    )
                    
                    createCircleOverlay(
                        color: .purple,
                        text: "mi",
                        width: geometry.size.width * 0.1,
                        height: geometry.size.height * 0.1,
                        xOffset: -geometry.size.width * 0.35,
                        yOffset: -geometry.size.height * 0.055
                    )
                }
            )
            .padding()
            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.175)
            .background(Color.white)
        }
    }
}
