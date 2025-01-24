//  Minorchord.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 11/12/24.
//

import SwiftUI

struct Minorchord: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Building Minor Chords")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 8)
                
                Text("A minor chord is a fundamental chord in music, known for its darker, more somber sound. It is created by stacking specific intervals, with the defining element being the minor third interval above the root note.")
                
                Text("Understanding the Minor Third Interval")
                    .font(.headline)
                
                Text("A minor third interval is three half steps (or one and a half whole steps) above the root note. For example, if we start with the note C, moving up a minor third brings us to Eb. This interval gives the minor chord its characteristic melancholy or introspective quality.")
                
                Text("Building the Minor Triad")
                    .font(.headline)
                
                Text("To build a minor chord, start with the root note, then add the minor third and the perfect fifth. This combination of three notes forms the minor triad:\n\n1. **Root**: The starting note of the chord.\n2. **Minor Third**: The note that is three half steps (or one and a half whole steps) above the root.\n3. **Perfect Fifth**: The note that is seven half steps (or three and a half whole steps) above the root.\n\nIn the C minor chord, this results in the notes C (root), Eb (minor third), and G (perfect fifth).")
                
                Text("The Effect of the Minor Third")
                    .font(.headline)
                
                Text("The minor third interval is what gives minor chords their unique, somber sound. While the major chord has a brighter feel due to its major third, the minor chord's minor third interval creates a moodier, more introspective tone. This makes minor chords ideal for conveying emotions like sadness, mystery, or tension in music.")
                
                Text("Examples of Minor Chords")
                    .font(.headline)
                
                Text("Here are some examples of minor chords built using the minor third interval:\n\n- **C Minor**: C - Eb - G\n- **A Minor**: A - C - E\n- **E Minor**: E - G - B\n\nIn each case, the minor third and perfect fifth intervals combine to create a sound distinct from their major counterparts.")
                
                Text("Summary")
                    .font(.headline)
                
                Text("Building minor chords by stacking a minor third and a perfect fifth above the root note creates the darker, more introspective sound characteristic of minor chords. This structure is foundational in Western music, offering an emotional contrast to major chords.")
            }
            .padding()
        }
    }
}

#Preview {
    Minorchord()
}
