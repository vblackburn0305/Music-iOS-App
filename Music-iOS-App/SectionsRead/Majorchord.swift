//  Majorchord.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 11/12/24.
//

import SwiftUI

struct Majorchord: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Building Major Chords")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 8)
                
                Text("A major chord is one of the most used chords in music. It has a bright, uplifting sound. As we discussed last time it is created by major thirds, on top of a root note.")
                
                Text("Understanding the Major Third Interval")
                    .font(.headline)
                
                Text("A major third interval is the distance of two whole steps (or four half steps) above the root note. For example, if we start with the note C, moving up a major third brings us to E. This interval gives the major chord its characteristic brightness.")
                
                Text("Building the Major Triad")
                    .font(.headline)
                
                Text("To build a major chord, start with the root note, for this example the root will be C, then add the major third from C, which is E and, then add the major third from E, which is G. This stacking of major thirds gives us the notes C E G, which are the notes for the C major chord. This three-note combination is known as a triad and is the basis of the major chord.\n\n1. **Root**: The starting note of the chord.\n2. **Major Third**: The note that is four half steps (or two whole steps) above the root.\n3. **Perfect Fifth**: The note that is seven half steps (or three and a half whole steps) above the root.\n\nIn the C major chord, this gives us the notes C (root), E (major third), and G (perfect fifth).")
                
                Text("Why Major Thirds?")
                    .font(.headline)
                
                Text("The major third interval creates a sense of stability and openness in the chord, contributing to its bright and harmonious sound. By combining the root with the major third and perfect fifth, the major chord balances these intervals to achieve a sound that is both powerful and pleasing.")
                
                Text("Examples of Major Chords")
                    .font(.headline)
                
                Text("Here are some examples of major chords built using the major third interval:\n\n- **C Major**: C - E - G\n- **G Major**: G - B - D\n- **F Major**: F - A - C\n\nIn each case, the major third and perfect fifth intervals combine to form a solid, uplifting sound.")
                
                Text("Summary")
                    .font(.headline)
                
                Text("Building major chords by stacking a major third and a perfect fifth above the root note is essential for creating the bright, stable sound that major chords are known for. This approach to chord building forms the foundation of harmony in much of Western music.")
            }
            .padding()
        }
    }
}

#Preview {
    Majorchord()
}
