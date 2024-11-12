import SwiftUI

struct Music_iOS_App_Quiz: View {
    @State private var levelOneCompleted = false
    @State private var levelTwoCompleted = false
    @State private var levelThreeCompleted = false
    @State private var isShowingQuizOne = false
    @State private var isShowingQuizTwo = false
    @State private var isShowingQuizThree = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Welcome to the Quiz Section")
                        .font(.title)
                        .bold()
                        .padding(.top, 40)
                    
                    Text("Click the button below to start the quiz for Level 1. Each quiz contains 10 questions about the level's material. Upon successful completion of each quiz, you’ll earn a gold star!")
                        .multilineTextAlignment(.center)
                        .padding()

                    VStack(spacing: 20) {
                        NavigationLink(destination: Music_iOS_App_Section_Quiz_One(levelCompleted: $levelOneCompleted), isActive: $isShowingQuizOne) {
                            Button(action: {
                                isShowingQuizOne = true
                            }) {
                                Text("Start Level 1 Quiz")
                                    .font(.headline)
                                    .padding()
                                    .frame(width: 200)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        
                        if levelOneCompleted {
                            NavigationLink(destination: Music_iOS_App_Section_Quiz_Two(levelCompleted: $levelTwoCompleted), isActive: $isShowingQuizTwo) {
                                Button(action: {
                                    isShowingQuizTwo = true
                                }) {
                                    Text("Start Level 2 Quiz")
                                        .font(.headline)
                                        .padding()
                                        .frame(width: 200)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        
                        if levelTwoCompleted {
                            NavigationLink(destination: Music_iOS_App_Section_Quiz_Three(levelCompleted: $levelThreeCompleted), isActive: $isShowingQuizThree) {
                                Button(action: {
                                    isShowingQuizThree = true
                                }) {
                                    Text("Start Level 3 Quiz")
                                        .font(.headline)
                                        .padding()
                                        .frame(width: 200)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        
                        // Stars below buttons
                        HStack(spacing: 10) {
                            Image(systemName: levelOneCompleted ? "star.fill" : "star")
                                .foregroundColor(levelOneCompleted ? .yellow : .gray)
                            Image(systemName: levelTwoCompleted ? "star.fill" : "star")
                                .foregroundColor(levelTwoCompleted ? .yellow : .gray)
                            Image(systemName: levelThreeCompleted ? "star.fill" : "star")
                                .foregroundColor(levelThreeCompleted ? .yellow : .gray)
                        }
                        .font(.largeTitle)
                        .padding(.top, 20)
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    Music_iOS_App_Quiz()
}
