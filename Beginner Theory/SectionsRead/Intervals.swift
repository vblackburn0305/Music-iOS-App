//
//  Intervals.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 11/12/24.
//

import SwiftUI

struct Intervals: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("Intervals are the building blocks of music. An interval is the distance between two notes.")
                
                Text("But what exactly is the distance between two notes? In Western music, this distance is measured in half steps, the smallest unit between two notes. For example, moving from one key to the adjacent key on a piano (black or white) is one half step.")
                
                Text("The number of half steps between two notes determines the type of interval. Let's start with the note C and explore the intervals it creates with other notes.")
                
                Text("1. **Major 2nd**: The distance between C and D is two half steps. This interval is called a major 2nd.")
                
                Text("2. **Major 3rd**: The distance between C and E is four half steps (or two whole steps). This creates the interval known as a major 3rd.")
                
                Text("3. **Perfect 4th**: The distance between C and F is five half steps, which creates a perfect 4th interval.")
                
                Text("4. **Perfect 5th**: The distance between C and G is seven half steps, resulting in a perfect 5th interval.")
                
                Text("5. **Major 6th**: The distance between C and A is nine half steps, creating a major 6th interval.")
                
                Text("6. **Major 7th**: Finally, the distance between C and B is eleven half steps, creating a major 7th interval.")
                
                Text("Intervals form the foundation for melody and harmony in music. Understanding intervals can help you identify and build chords, scales, and more.")
            }
            .padding()
            .font(.body)
        }
    }
}

#Preview {
    Intervals()
}
