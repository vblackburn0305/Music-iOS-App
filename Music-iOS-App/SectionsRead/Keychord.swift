//  Keychord.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 11/12/24.
//

import SwiftUI

struct Keychord: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Understanding Keys and Chord Order")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 8)
                
                Text("In music, a key is a group of notes centered around a 'home' note, or tonic, that establishes the tonal foundation for a piece. A key defines which chords are likely to appear, creating a sense of harmony and coherence.")
                
                Text("Order of Chords in a Key")
                    .font(.headline)
                
                Text("Each key has a standard order of chords built on each note of the scale. In a major key, the chords follow this pattern:\n\n- I (major) – Tonic\n- ii (minor) – Supertonic\n- iii (minor) – Mediant\n- IV (major) – Subdominant\n- V (major or dominant 7) – Dominant\n- vi (minor) – Submediant\n- vii° (diminished) – Leading tone\n\nThese chords are numbered by scale degree and play specific roles within progressions.")
                
                Text("How Sus Chords Fit In")
                    .font(.headline)
                
                Text("Suspended (sus) chords can add variety within a key. Typically, sus2 and sus4 chords are used in place of major or minor chords to create a feeling of tension or anticipation. For example:\n\n- **Sus2**: Often substitutes ii or V chords for a softer, open sound.\n- **Sus4**: Commonly used on IV or V chords, especially in progressions where it resolves back to the original major or minor chord.\n\nSus chords allow for expressive transitions in a progression, enhancing the emotional impact.")
            }
            .padding()
        }
    }
}

#Preview {
    Keychord()
}
