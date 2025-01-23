//  Suschord.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 11/12/24.
//

import SwiftUI

struct Suschord: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Building Suspended (Sus) Chords")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 8)
                
                Text("Suspended, or 'sus,' chords are unique chords that replace the traditional third interval with either a second or fourth. This creates an open, unresolved sound, as the chord lacks the clear major or minor quality provided by a third.")
                
                Text("Types of Suspended Chords")
                    .font(.headline)
                
                Text("There are two main types of suspended chords:\n\n1. **Sus2 Chord**: Uses the second interval instead of the third.\n2. **Sus4 Chord**: Uses the fourth interval instead of the third.\n\nBoth types produce a sound that feels unresolved or anticipatory, often resolving back to a major or minor chord in progressions.")
                
                Text("Building the Sus2 Chord")
                    .font(.headline)
                
                Text("To build a **sus2 chord**, start with the root note, add the major second, and finish with the perfect fifth.\n\n1. **Root**: The starting note of the chord.\n2. **Major Second**: The note that is two half steps (or one whole step) above the root.\n3. **Perfect Fifth**: The note that is seven half steps above the root.\n\nFor example, a C sus2 chord consists of the notes C (root), D (major second), and G (perfect fifth). The lack of a third gives it a suspended quality.")
                
                Text("Building the Sus4 Chord")
                    .font(.headline)
                
                Text("To build a **sus4 chord**, start with the root note, add the perfect fourth, and finish with the perfect fifth.\n\n1. **Root**: The starting note of the chord.\n2. **Perfect Fourth**: The note that is five half steps (or two and a half whole steps) above the root.\n3. **Perfect Fifth**: The note that is seven half steps above the root.\n\nFor example, a C sus4 chord consists of the notes C (root), F (perfect fourth), and G (perfect fifth). This chord also feels unresolved, often resolving to a C major or minor chord.")
                
                Text("The Unique Sound of Suspended Chords")
                    .font(.headline)
                
                Text("Suspended chords are used to create a sense of tension or anticipation. Because they lack the major or minor third, they don’t convey a strong emotion on their own. Instead, they sound neutral and open, which can be ideal for adding interest in chord progressions. Musicians often resolve sus chords to a standard major or minor chord to complete the harmonic movement.")
                
                Text("Examples of Sus Chords")
                    .font(.headline)
                
                Text("Here are some common examples:\n\n- **C Sus2**: C - D - G\n- **D Sus4**: D - G - A\n- **G Sus2**: G - A - D\n\nThese chords add variation and can be used to make music feel more dynamic.")
                
                Text("Summary")
                    .font(.headline)
                
                Text("Suspended chords replace the third with a second or fourth, creating a sound that feels unresolved. They offer a neutral harmonic quality that can lead smoothly into more definitive major or minor chords, making them versatile in many styles of music.")
            }
            .padding()
        }
    }
}

#Preview {
    Suschord()
}
