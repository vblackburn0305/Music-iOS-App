import SwiftUI

struct Music_iOS_App_Quiz: View {
    @State private var quizOneState: QuizState?
    @State private var quizTwoState: QuizState?
    @State private var quizThreeState: QuizState?

    @State private var isShowingQuizOne = false
    @State private var isShowingQuizTwo = false
    @State private var isShowingQuizThree = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        Text("Welcome to the Quiz Section")
                            .font(.title)
                            .bold()
                            .padding(.top, 40)
                            .frame(maxWidth: .infinity, alignment: .center)

                        Text("Click the button below to start the quiz for Level 1. Each quiz contains 10 questions about the level's material. Upon successful completion of each quiz, you’ll earn a gold star!")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        VStack(spacing: 20) {
                            // LEVEL 1 BUTTON
                            NavigationLink(
                                destination: Music_iOS_App_Section_Quiz_One(),
                                isActive: $isShowingQuizOne
                            ) {
                                Button(action: {
                                    isShowingQuizOne = true
                                }) {
                                    Text(quizOneState?.didPass == true
                                         ? "Retake Level 1 Quiz"
                                         : "Start Level 1 Quiz")
                                        .font(.headline)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .frame(maxWidth: 300) // Limit the button width
                            }

                            // LEVEL 2 BUTTON
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
                                            .frame(maxWidth: .infinity)
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                    .frame(maxWidth: 300)
                                }
                            }

                            // LEVEL 3 BUTTON
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
                                            .frame(maxWidth: .infinity)
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                    .frame(maxWidth: 300)
                                }
                            }

                            // STARS
                            HStack(spacing: 10) {
                                Image(systemName: quizOneState?.hasGoldStar == true ? "star.fill" : "star")
                                    .foregroundColor(quizOneState?.hasGoldStar == true ? .yellow : .gray)

                                Image(systemName: quizTwoState?.hasGoldStar == true ? "star.fill" : "star")
                                    .foregroundColor(quizTwoState?.hasGoldStar == true ? .yellow : .gray)

                                Image(systemName: quizThreeState?.hasGoldStar == true ? "star.fill" : "star")
                                    .foregroundColor(quizThreeState?.hasGoldStar == true ? .yellow : .gray)
                            }
                            .font(.largeTitle)
                            .padding(.top, 20)
                        }

                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
            }
            .onAppear {
                DatabaseManager.shared.insertQuiz(levelName: "Level 1")
                DatabaseManager.shared.insertQuiz(levelName: "Level 2")
                DatabaseManager.shared.insertQuiz(levelName: "Level 3")

                quizOneState = DatabaseManager.shared.getQuizState(for: "Level 1")
                quizTwoState = DatabaseManager.shared.getQuizState(for: "Level 2")
                quizThreeState = DatabaseManager.shared.getQuizState(for: "Level 3")
            }
        }
    }
}
