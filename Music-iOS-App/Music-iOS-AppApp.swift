import SwiftUI

@main
struct Music_iOS_AppApp: App {

    init() {
        DatabaseManager.shared.insertQuiz(levelName: "Grade 1")
        DatabaseManager.shared.insertQuiz(levelName: "Grade 2")
        DatabaseManager.shared.insertQuiz(levelName: "Grade 3")
    }
    
    var body: some Scene {
        WindowGroup {
            Music_iOS_App_Tab_View()
                .onAppear() {
                   // print(URL.documentsDirectory.path())
                }
        }
    }
}

struct Music_iOS_AppApp_Preview: View {
    var body: some View {
        Music_iOS_App_Tab_View()
    }
}

#Preview {
    Music_iOS_AppApp_Preview()
}
