import SwiftUI
// this is the main entry point into the app
@main
struct Music_iOS_AppApp: App {

    init() {
        // inserts quizzes into the database
        // prepares the app with the quiz data
        DatabaseManager.shared.insertQuiz(levelName: "Grade 1")
        DatabaseManager.shared.insertQuiz(levelName: "Grade 2")
        DatabaseManager.shared.insertQuiz(levelName: "Grade 3")
    }
    
    var body: some Scene {
        WindowGroup { // main window
            Music_iOS_App_Tab_View() // specifies the main window and the root scene
                // Force Light Mode for all views in this hierarchy
                .preferredColorScheme(.light)
                .onAppear() {
                   // print(URL.documentsDirectory.path())
                }
        }
    }
}

// preview display for development
struct Music_iOS_AppApp_Preview: View {
    var body: some View {
        Music_iOS_App_Tab_View()
    }
}

#Preview {
    Music_iOS_AppApp_Preview()
}
