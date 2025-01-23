import SwiftUI

struct Music_iOS_App_Quiz: View {
    // We store the DB state for each quiz level
    @State private var quizOneState: QuizState?
    @State private var quizTwoState: QuizState?
    @State private var quizThreeState: QuizState?
    
    // For NavigationLinks
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
                        
                        // LEVEL 1 BUTTON
                        NavigationLink(
                            destination: Music_iOS_App_Section_Quiz_One(),
                            isActive: $isShowingQuizOne
                        ) {
                            // The label is a separate button you tap
                            Button(action: {
                                isShowingQuizOne = true
                            }) {
                                Text(quizOneState?.didPass == true
                                     ? "Retake Level 1 Quiz"
                                     : "Start Level 1 Quiz")
                                    .font(.headline)
                                    .padding()
                                    .frame(width: 200)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        
                        // LEVEL 2 BUTTON (Shown only if Level 1 is passed)
                        if quizOneState?.didPass == true {
                            NavigationLink(
                                destination: Music_iOS_App_Section_Quiz_Two(),
                                isActive: $isShowingQuizTwo
                            ) {
                                Button(action: {
                                    isShowingQuizTwo = true
                                }) {
                                    Text(quizTwoState?.didPass == true
                                         ? "Retake Level 2 Quiz"
                                         : "Start Level 2 Quiz")
                                        .font(.headline)
                                        .padding()
                                        .frame(width: 200)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        
                        // LEVEL 3 BUTTON (Shown only if Level 2 is passed)
                        if quizTwoState?.didPass == true {
                            NavigationLink(
                                destination: Music_iOS_App_Section_Quiz_Three(),
                                isActive: $isShowingQuizThree
                            ) {
                                Button(action: {
                                    isShowingQuizThree = true
                                }) {
                                    Text(quizThreeState?.didPass == true
                                         ? "Retake Level 3 Quiz"
                                         : "Start Level 3 Quiz")
                                        .font(.headline)
                                        .padding()
                                        .frame(width: 200)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        
                        // STARS BELOW BUTTONS
                        HStack(spacing: 10) {
                            // LEVEL 1 STAR
                            Image(systemName: quizOneState?.hasGoldStar == true ? "star.fill" : "star")
                                .foregroundColor(quizOneState?.hasGoldStar == true ? .yellow : .gray)
                            
                            // LEVEL 2 STAR
                            Image(systemName: quizTwoState?.hasGoldStar == true ? "star.fill" : "star")
                                .foregroundColor(quizTwoState?.hasGoldStar == true ? .yellow : .gray)
                            
                            // LEVEL 3 STAR
                            Image(systemName: quizThreeState?.hasGoldStar == true ? "star.fill" : "star")
                                .foregroundColor(quizThreeState?.hasGoldStar == true ? .yellow : .gray)
                        }
                        .font(.largeTitle)
                        .padding(.top, 20)
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 40)
            }
            // On appear, load or insert quizzes from DB
            .onAppear {
                // Insert (only if they don't exist) each quiz
                DatabaseManager.shared.insertQuiz(levelName: "Level 1")
                DatabaseManager.shared.insertQuiz(levelName: "Level 2")
                DatabaseManager.shared.insertQuiz(levelName: "Level 3")
                
                // Fetch their current states
                quizOneState   = DatabaseManager.shared.getQuizState(for: "Level 1")
                quizTwoState   = DatabaseManager.shared.getQuizState(for: "Level 2")
                quizThreeState = DatabaseManager.shared.getQuizState(for: "Level 3")
            }
        }
    }
}

#Preview {
    Music_iOS_App_Quiz()
}
