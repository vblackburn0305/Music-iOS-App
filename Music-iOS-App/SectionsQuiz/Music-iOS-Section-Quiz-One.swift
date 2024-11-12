import SwiftUI

struct Music_iOS_App_Section_Quiz_One: View {
    @Binding var levelCompleted: Bool
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showResult = false
    @State private var selectedAnswer: String? = nil

    let questions = [
        Question(text: "What distance is a perfect fifth in half steps?", answers: ["One half step", "Three half steps", "Seven half steps"], correctAnswer: "Seven half steps"),
        Question(text: "What note is a perfect fourth above C?", answers: ["F", "G", "E"], correctAnswer: "F"),
        Question(text: "What is the interval pattern for a major scale?", answers: ["Whole, Whole, Half, Whole, Whole, Whole, Half", "Whole, Half, Whole, Half", "Whole, Whole, Whole, Whole"], correctAnswer: "Whole, Whole, Half, Whole, Whole, Whole, Half"),
        Question(text: "What is the major scale formula in intervals?", answers: ["Major 2nd major 3rd perfect 4th perfect 5th major 6th major 7th", "Major 2nd minor 3rd perfect 4th perfect 5th major 6th major 7th", "Major 2nd major 3rd perfect 4th augmented 5th major 6th major 7th"], correctAnswer: "Major 2nd major 3rd perfect 4th perfect 5th major 6th major 7th"),
        Question(text: "What note is a major second above G?", answers: ["A", "C", "B"], correctAnswer: "A"),
        Question(text: "What is the 3rd mode of the major scale?", answers: ["Ionian", "Locrian", "Phrygian"], correctAnswer: "Phrygian"),
        Question(text: "What note is a minor third above E?", answers: ["G", "F", "Eb"], correctAnswer: "G"),
        Question(text: "How many notes in a major scale?", answers: ["6", "7", "5"], correctAnswer: "7"),
        Question(text: "What is the last note in a C major scale?", answers: ["C", "B", "D"], correctAnswer: "B"),
        Question(text: "What interval is bigger a perfect 5th or minor 6th?", answers: ["Perfect 5th", "Minor 6th", "Same"], correctAnswer: "Same")
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Level 1 Quiz")
                .font(.title2)
                .padding()
            
            if levelCompleted {
                Text("Congratulations! You've completed Level 1.")
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
                        Text("Good Luck!")
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

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
}

#Preview {
    Music_iOS_App_Section_Quiz_One(levelCompleted: .constant(false))
}
