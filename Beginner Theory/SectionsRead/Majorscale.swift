//  Majorscale.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 11/12/24.
//

import SwiftUI

struct Majorscale: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("The Major Scale")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 8)
                
                Text("The major scale is one of the most fundamental scales in music, serving as the basis for many other scales and musical concepts. It's built from a specific sequence of intervals that create its distinctive sound.")
                
                Text("Relationship to Intervals")
                    .font(.headline)
                
                Text("The major scale is constructed using a sequence of whole and half steps (intervals). Starting from the root note, the pattern for the major scale follows these intervals:\n\nWhole - Whole - Half - Whole - Whole - Whole - Half\n\nFor example, in the C major scale, this pattern results in the notes: C - D - E - F - G - A - B - C. Each step between the notes adheres to this interval pattern, which gives the major scale its unique sound.")
                
                Text("Building the Major Scale")
                    .font(.headline)
                
                Text("The formula for the major scale in terms of intervals is straightforward:\n\n Major 2nd - Major 3rd - Pefect 4th - Perfect 5th - Major 6th - Major 7th.\n\nBy following this interval sequence starting from any root note, you can build a major scale in any key.")
                
                Text("Altering these notes by a half step can result creating a new scale. Something we will look at next is the minor scale, which is derived from the major scale, but built with a minor 3rd, minor 6th, and minor 7th instead.")
                
                
                Text("Creating Other Scales by Altering Intervals")
                    .font(.headline)
                
                Text("By changing certain intervals within the major scale, we can create different types of scales. Here are a few examples:\n\n- **Natural Minor Scale**: To form the natural minor scale, lower the 3rd, 6th, and 7th notes of the major scale by a half step.\n\n- **Harmonic Minor Scale**: To create the harmonic minor scale, lower the 3rd and 6th notes by a half step, but keep the 7th note as it is in the major scale.\n\nThese alterations give each scale a unique sound and feel, allowing for different moods in music.")
                
                Text("Modes Derived from the Major Scale")
                    .font(.headline)
                
                Text("Modes are scales derived by altering the starting point of the major scale. By shifting the root note but keeping the interval structure intact, each mode takes on its own distinct character.\n\nHere are the seven modes of the major scale:\n\n1. **Ionian**: The major scale itself, starting on the first note.\n2. **Dorian**: Starts on the second note of the major scale.\n3. **Phrygian**: Starts on the third note of the major scale.\n4. **Lydian**: Starts on the fourth note.\n5. **Mixolydian**: Starts on the fifth note.\n6. **Aeolian**: The natural minor scale, starting on the sixth note.\n7. **Locrian**: Starts on the seventh note.\n\nEach mode has a unique interval pattern, and shifting the starting note produces subtle changes in the sound, creating various moods and styles within the framework of the major scale.")
                
                Text("Summary")
                    .font(.headline)
                
                Text("Understanding how the major scale is built from intervals allows musicians to explore other scales, modes, and musical styles. By adjusting intervals, we can create scales with distinct sounds and emotions, making the major scale a foundational tool in music theory.")
            }
            .padding()
        }
    }
}

#Preview {
    Majorscale()
}
