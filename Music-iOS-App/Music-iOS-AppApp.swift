import SwiftUI

@main
struct Music_iOS_AppApp: App {
    var body: some Scene {
        WindowGroup {
            Music_iOS_App_Tab_View()
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
