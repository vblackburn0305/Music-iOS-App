import SwiftUI

struct Music_iOS_App_Read: View {
    var body: some View {
        NavigationView {
            List {
                // Level 1 Section
                Section(header: HStack {
                    Text("Level 1")
                        .font(.title2)
                        .bold()
                }) {
                    NavigationLink(destination: Intervals()) {
                        Text("What are intervals?")
                    }
                    NavigationLink(destination: FourthCircle()) {
                                            Text("Circle of 4ths")
                                        }
                    NavigationLink(destination: Majorscale()) {
                                            Text("Major scale and more")
                                        }
                }
                
                // Level 2 Section
                Section(header: HStack {
                    Text("Level 2")
                        .font(.title2)
                        .bold()
                }) {
                    NavigationLink(destination: Chordformula()) {
                                            Text("Chord formulas")
                                        }
                    NavigationLink(destination: Majorchord()) {
                                            Text("Major chords")
                                        }
                    NavigationLink(destination: Minorchord()) {
                                            Text("Minor chords")
                                        }
                    NavigationLink(destination: Suschord()) {
                                            Text("Sus chords")
                                        }
                }
                
                // Level 3 Section
                Section(header: HStack {
                    Text("Level 3")
                        .font(.title2)
                        .bold()
                }) {
                    NavigationLink(destination: Keychord()) {
                                            Text("Order of chords in a key")
                                        }
                    NavigationLink(destination: chordprogression()) {
                                            Text("Chord progressions")
                                        }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}

#Preview {
    Music_iOS_App_Read()
}
