//  Chordformula.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 11/12/24.
//

import SwiftUI

struct Chordformula: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Chord Formulas")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 8)
                
                Text("Chords are built by stacking intervals from a scale, typically starting from the root note and using specific patterns to define each chord type. These patterns, known as chord formulas, provide the blueprint for creating various types of chords.")
                
                Text("Building Chords from the Major Scale")
                    .font(.headline)
                
                Text("The major scale serves as a foundation for many chord formulas. Chords are typically built by stacking thirds, a common interval in music. For example, to build a chord, start with the root note of the scale and then add the 3rd and 5th notes above it.\n\nThis technique of stacking notes creates different types of chords based on which notes you include and how you alter them.")
                
                Text("Summary")
                    .font(.headline)
                
                Text("Chord formulas provide a structured way to build chords from scales. By understanding these formulas, musicians can create harmonious sounds, progressions, and the backbone of countless musical pieces.")
            }
            .padding()
        }
    }
}

#Preview {
    Chordformula()
}
