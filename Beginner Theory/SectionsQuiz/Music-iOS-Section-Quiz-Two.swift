import SwiftUI

struct Music_iOS_App_Section_Quiz_Two: View {
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showResult = false
    @State private var selectedAnswer: String? = nil

    @Environment(\.presentationMode) private var presentationMode

    let questions = [
        Question(text: "Which interval is used to build a major chord?", answers: ["Major third", "Minor third", "Augmented fifth"], correctAnswer: "Major third"),
        Question(text: "What interval is found in a minor chord?", answers: ["Minor third", "Major third", "Perfect fourth"], correctAnswer: "Minor third"),
        Question(text: "What is the formula for a major chord?", answers: ["Root, major third, perfect fifth", "Root, minor third, perfect fifth", "Root, major third, minor sixth"], correctAnswer: "Root, major third, perfect fifth"),
        Question(text: "How many notes are in a triad?", answers: ["5", "3", "4"], correctAnswer: "3"),
        Question(text: "What chord formula includes a sus4?", answers: ["Root, perfect fourth, perfect fifth", "Root, major third, perfect fifth", "Root, minor third, perfect fourth"], correctAnswer: "Root, perfect fourth, perfect fifth"),
        Question(text: "With what intervals are chords stacked from?", answers: ["3rds", "4ths", "5ths"], correctAnswer: "3rds"),
        Question(text: "What is the difference between a major chord and minor chord?", answers: ["5th", "Root", "3rd"], correctAnswer: "3rd"),
        Question(text: "Which chords are ambiguous?", answers: ["Major", "Minor", "Sus"], correctAnswer: "Sus"),
        Question(text: "What is the formula for a sus2 chord?", answers: ["Root, major second, perfect fifth", "Root, perfect fourth, major sixth", "Root, minor third, diminished fifth"], correctAnswer: "Root, major second, perfect fifth"),
        Question(text: "What triad type do the notes C, Eb, and G make?", answers: ["Power chord", "Minor chord", "Diminished chord"], correctAnswer: "Minor chord")
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Level 2 Quiz")
                .font(.title2)
                .padding(.top, 20)

            // Question info
            HStack {
                Text("Question \(currentQuestionIndex + 1) of \(questions.count)")
                    .font(.subheadline)
                    .bold()
                Spacer()
                Text("Score: \(score)")
                    .font(.subheadline)
                    .bold()
            }
            .padding(.horizontal)

            // Question box + answers
            VStack(spacing: 15) {
                Text(questions[currentQuestionIndex].text)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.blue.opacity(0.1))
                    )
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)

                ForEach(questions[currentQuestionIndex].answers, id: \.self) { answer in
                    Button(action: {
                        selectedAnswer = answer
                        checkAnswer()
                    }) {
                        Text(answer)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.gray.opacity(0.2))
                            )
                            .multilineTextAlignment(.center)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)

            Spacer()

            if showResult {
                VStack(spacing: 20) {
                    Text(score >= 7 ? "Congratulations, you passed!"
                                    : "You failed. Try again.")
                        .font(.headline)

                    HStack(spacing: 20) {
                        Button("Restart Quiz") {
                            resetQuiz()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)

                        Button("Done") {
                            presentationMode.wrappedValue.dismiss()
                        }
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        // Make sure we respect safe areas so we don’t overlap the tab bar.
        .padding(.bottom, 20)
        .background(Color.gray.opacity(0.1))
    }

    // MARK: - Methods

    func checkAnswer() {
        if selectedAnswer == questions[currentQuestionIndex].correctAnswer {
            score += 1
        }

        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            showResult = true
            let userPassed = (score >= 7)
            DatabaseManager.shared.updateQuiz(
                levelName: "Level 2",
                passed: userPassed,
                goldStar: userPassed
            )
        }
        selectedAnswer = nil
    }

    func resetQuiz() {
        currentQuestionIndex = 0
        score = 0
        showResult = false
        selectedAnswer = nil
    }
}
