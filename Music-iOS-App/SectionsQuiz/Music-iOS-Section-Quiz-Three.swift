import SwiftUI

struct Music_iOS_App_Section_Quiz_Three: View {
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showResult = false
    @State private var selectedAnswer: String? = nil
    
    @Environment(\.presentationMode) private var presentationMode

    let questions = [
            Question(text: "Which chord progression is common in pop music?", answers: ["I–V–vi–IV", "ii–V–I", "V–I–IV"], correctAnswer: "I–V–vi–IV"),
            Question(text: "What is a common jazz progression?", answers: ["ii–V–I", "I–V–vi–IV", "IV–I–V"], correctAnswer: "ii–V–I"),
            Question(text: "In the key of C, what chords are in the I–V–vi–IV progression?", answers: ["C–G–Am–F", "D–A–Bm–G", "E–B–C#m–A"], correctAnswer: "C–G–Am–F"),
            Question(text: "Which progression is often used in blues music?", answers: ["I–IV–V", "vi–IV–I–V", "ii–iii–vi–I"], correctAnswer: "I–IV–V"),
            Question(text: "What is the I chord in the key of G?", answers: ["G", "D", "C"], correctAnswer: "G"),
            Question(text: "Which progression has a 'resolution' effect?", answers: ["V–I", "IV–V", "ii–IV"], correctAnswer: "V–I"),
            Question(text: "What is the order of chords in a key?", answers: ["Major, Minor, Minor, Major, Major, Minor, Diminished", "Major, Major, Minor, Major, Major, Minor, Diminished", "Major, Minor, Minor, Major, Major, Minor, Minor"], correctAnswer: "Major, Minor, Minor, Major, Major, Minor, Diminished"),
            Question(text: "Can a Sus2 chord replace a chord from a key", answers: ["Yes", "No", "Depends on the chord"], correctAnswer: "Depends on the chord"),
            Question(text: "In jazz, what is the ii–V–I progression for C?", answers: ["Dm7–G7–Cmaj7", "Am7–D7–Gmaj7", "Em7–A7–Dmaj7"], correctAnswer: "Dm7–G7–Cmaj7"),
            Question(text: "Which progression is often used in classical music?", answers: ["I–IV–V–I", "ii–vi–I", "V–I–vi"], correctAnswer: "I–IV–V–I")
        ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Level 3 Quiz")
                .font(.title2)
                .padding()
            
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

            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Good Luck")
                        .font(.subheadline)
                        .bold()
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(questions[currentQuestionIndex].text)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.blue.opacity(0.1))
                        )
                        .multilineTextAlignment(.center)

                    VStack(spacing: 10) {
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
                                            .fill(Color.gray.opacity(0.1))
                                    )
                                    .multilineTextAlignment(.center)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                )
                .shadow(radius: 5)
                .padding()
            }

            Spacer()

            if showResult {
                VStack(spacing: 20) {
                    Text(score >= 7 ? "Congratulations, you passed!"
                                    : "You failed. Try again.")
                        .font(.headline)
                        .padding()

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
                }
            }
        }
        .padding()
    }

    func checkAnswer() {
        // Correctness
        if selectedAnswer == questions[currentQuestionIndex].correctAnswer {
            score += 1
        }
        
        // Next or finish
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            showResult = true
            let userPassed = (score >= 7)
            
            // Update DB for "Level 3"
            DatabaseManager.shared.updateQuiz(
                levelName: "Level 3",
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

// For preview, ensure Question is defined somewhere
#Preview {
    Music_iOS_App_Section_Quiz_Three()
}
