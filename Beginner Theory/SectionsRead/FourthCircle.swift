//  FourthCircle.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 11/12/24.
//

import SwiftUI

struct FourthCircle: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                Text("Circle of Fourths")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 8)
                
                Text("The Circle of Fourths is a way to visualize the relationship between musical notes when moving by intervals of a perfect fourth. Starting from C and moving clockwise, each subsequent note is a fourth higher than the previous one. This circle is useful for musicians because it demonstrates common chord progressions, helps with transposing music, and aids in understanding key signatures.")
                
                Text("In the Circle of Fourths, the notes are arranged as follows:")
                Text("C → F → Bb → Eb → Ab → Db → Gb → B → E → A → D → G → C")
                    .font(.headline)
                    .padding(.bottom, 8)
                
                Text("This sequence is helpful for navigating the notes in a way that aligns with many music patterns. For example, the progression from C to F to Bb is common in jazz music and is based on fourths. Similarly, when improvising or creating chord progressions, musicians can refer to this circle to choose harmonically compatible notes.")
                
               
                Text("Understanding the Circle of Fourths helps you see the structure within music, making it easier to predict and create harmonious sounds across different keys.")
            }
            .padding()
        }
    }
}

#Preview {
    FourthCircle()
}
