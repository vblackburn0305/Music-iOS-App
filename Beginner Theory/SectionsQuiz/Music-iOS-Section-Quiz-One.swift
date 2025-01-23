import SwiftUI

struct Music_iOS_App_Section_Quiz_One: View {
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showResult = false
    @State private var selectedAnswer: String? = nil
    
    @Environment(\.presentationMode) private var presentationMode

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
            
            // Title and top spacing
            Text("Level 1 Quiz")
                .font(.title)
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
            
            // Question text + answers
            VStack(spacing: 15) {
                
                // Let the question text wrap automatically:
                Text(questions[currentQuestionIndex].text)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.blue.opacity(0.1))
                    )
                    .multilineTextAlignment(.center)
                    // This ensures text grows vertically if it’s long.
                    .fixedSize(horizontal: false, vertical: true)

                // Answer buttons
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
            
            // Final result
            if showResult {
                VStack(spacing: 20) {
                    Text(score >= 7 ? "Congratulations, you passed!" : "You failed. Try again.")
                        .font(.headline)
                    
                    HStack(spacing: 20) {
                        Button("Restart Quiz") {
                            resetQuiz()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)

                        Button("Done") {
                            presentationMode.wrappedValue.dismiss()
                        }
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .padding(.bottom, 20)
        .background(Color.gray.opacity(0.1)) // no ignoresSafeArea here
    }
    
    // MARK: - Quiz Logic
    
    func checkAnswer() {
        if selectedAnswer == questions[currentQuestionIndex].correctAnswer {
            score += 1
        }
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            showResult = true
            
            // IF the user got 7 or more correct:
            let userPassed = (score >= 7)
            
            // >>> Update DB row so didPass == true (if passed) <<<
            DatabaseManager.shared.updateQuiz(
                levelName: "Level 1",
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

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
}
