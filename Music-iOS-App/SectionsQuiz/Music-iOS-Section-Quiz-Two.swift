import SwiftUI

struct Music_iOS_App_Section_Quiz_Two: View {
    @Binding var levelCompleted: Bool
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showResult = false
    @State private var selectedAnswer: String? = nil

    let questions = [
        Question(text: "Which interval is used to build a major chord?", answers: ["Major third", "Minor third", "Augmented fifth"], correctAnswer: "Major third"),
        Question(text: "What interval is found in a minor chord?", answers: ["Minor third", "Major third", "Perfect fourth"], correctAnswer: "Minor third"),
        Question(text: "What is the formula for a major chord?", answers: ["Root, major third, perfect fifth", "Root, minor third, perfect fifth", "Root, major third, minor sixth"], correctAnswer: "Root, major third, perfect fifth"),
        Question(text: "How many notes are in a triad?", answers: ["5", "3", "4"], correctAnswer: "3"),
        Question(text: "What chord formula includes a sus4?", answers: ["Root, perfect fourth, perfect fifth", "Root, major third, perfect fifth", "Root, minor third, perfect fourth"], correctAnswer: "Root, perfect fourth, perfect fifth"),
        Question(text: "With what intervals are chords stacked from?", answers: ["3rds", "4ths", "5ths"], correctAnswer: "3rds"),
        Question(text: "What is the difference between a major chord and minor chord?", answers: ["5th", "Root", "3rd"], correctAnswer: "3rd"),
        Question(text: "What chords are ambigious?", answers: ["Major", "Minor", "Sus"], correctAnswer: "Sus"),
        Question(text: "What is the formula for a sus2 chord?", answers: ["Root, major second, perfect fifth", "Root, perfect fourth, major sixth", "Root, minor third, diminished fifth"], correctAnswer: "Root, major second, perfect fifth"),
        Question(text: "What triad type do the notes C, Eb, and G make", answers: ["Power chord", "Minor chord", "Diminished chord"], correctAnswer: "Minor chord")
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Level 2 Quiz")
                .font(.title2)
                .padding()
            
            if levelCompleted {
                Text("Congratulations! You've completed Level 2.")
                    .font(.headline)
                    .padding()
            } else {
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
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.blue.opacity(0.1)))
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
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                                        .multilineTextAlignment(.center)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                    .shadow(radius: 5)
                    .padding()
                }
            }

            Spacer()

            if showResult {
                VStack {
                    Text(score >= 7 ? "Congratulations, you passed!" : "You failed. Try again.")
                        .font(.headline)
                        .padding()

                    Button("Restart Quiz") {
                        resetQuiz()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
        }
        .padding()
    }

    func checkAnswer() {
        if selectedAnswer == questions[currentQuestionIndex].correctAnswer {
            score += 1
        }
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            showResult = true
            levelCompleted = score >= 7
        }
        selectedAnswer = nil
    }

    func resetQuiz() {
        currentQuestionIndex = 0
        score = 0
        showResult = false
    }
}
#Preview {
    Music_iOS_App_Section_Quiz_Two(levelCompleted: .constant(false))
}
