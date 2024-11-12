//  chordprogression.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 11/12/24.
//

import SwiftUI

struct chordprogression: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Common Chord Progressions in Popular Music")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 8)
                
                Text("Chord progressions are sequences of chords that form the harmonic foundation of a song. Certain progressions are widely used in popular music because of their pleasing, familiar sound. Here are some of the most common progressions and examples of their use.")
                
                Text("I - V - vi - IV")
                    .font(.headline)
                
                Text("One of the most popular progressions in pop music, often called the 'four-chord progression.' This sequence moves from the tonic (I) to the dominant (V), then to the relative minor (vi), and finally to the subdominant (IV). It's known for its emotional impact and is used in countless songs, including 'Let It Be' by The Beatles and 'With or Without You' by U2.")
                
                Text("ii - V - I")
                    .font(.headline)
                
                Text("A staple in jazz and blues, this progression creates a smooth, satisfying resolution. Starting from the minor supertonic (ii), moving to the dominant (V), and resolving to the tonic (I), it’s the backbone of many jazz standards and provides a stable, resolved sound.")
                
                Text("I - IV - V")
                    .font(.headline)
                
                Text("Known as the 'three-chord progression,' this sequence is common in rock, folk, and blues. Moving from the tonic (I) to the subdominant (IV) and then to the dominant (V), this progression is simple but powerful. Songs like 'Twist and Shout' by The Beatles and 'La Bamba' by Ritchie Valens use this progression.")
                
                Text("vi - IV - I - V")
                    .font(.headline)
                
                Text("This progression, sometimes called the 'sensitive female chord progression,' starts on the vi, giving it a reflective or emotional tone. Popular in ballads and pop music, examples include 'Someone Like You' by Adele and 'If I Were a Boy' by Beyoncé.")
                
                Text("12-Bar Blues (I - I - I - I - IV - IV - I - I - V - IV - I - V)")
                    .font(.headline)
                
                Text("A defining progression in blues, the 12-bar blues sequence is characterized by its repeated form and predictable structure. This progression has influenced countless rock and blues songs, including 'Hound Dog' by Elvis Presley and 'Sweet Home Chicago' by Robert Johnson.")
                
                Text("Summary")
                    .font(.headline)
                
                Text("These common chord progressions are foundational in popular music. They’re memorable, versatile, and can be adapted to fit various genres, giving countless songs their harmonic structure and emotional appeal.")
            }
            .padding()
        }
    }
}

#Preview {
    chordprogression()
}
