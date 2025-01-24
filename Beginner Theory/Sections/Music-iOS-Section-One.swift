import SwiftUI

struct Music_iOS_Section_One: View {
    let geometry: GeometryProxy
    
    var body: some View {
        VStack {
            Text("Level 1: Intervals and scales")
                .font(.title3)
                .padding(.leading, UIScreen.main.bounds.width * (0.5 / 9))
            Text("Learn about the building blocks of music and how they build scales!")
                .font(.body)
                .fontWeight(.thin)
                .padding(.leading, UIScreen.main.bounds.width * (1 / 9))
        }
        .overlay(
            ZStack {
                CircleOverlayView(
                    color: .green,
                    text: "do",
                    width: geometry.size.width * 0.1,
                    height: geometry.size.height * 0.1,
                    xOffset: -geometry.size.width * 0.35,
                    yOffset: geometry.size.height * 0.058
                )
                CircleOverlayView(
                    color: .blue,
                    text: "re",
                    width: geometry.size.width * 0.1,
                    height: geometry.size.height * 0.1,
                    xOffset: -geometry.size.width * 0.35,
                    yOffset: geometry.size.height * 0.001
                )
                CircleOverlayView(
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
        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.18)
        .background(Color.white)
    }
}

struct CircleOverlayView: View {
    let color: Color
    let text: String
    let width: CGFloat
    let height: CGFloat
    let xOffset: CGFloat
    let yOffset: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: width, height: height)
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
        }
        .offset(x: xOffset, y: yOffset)
    }
}
