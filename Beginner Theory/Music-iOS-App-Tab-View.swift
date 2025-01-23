import SwiftUI

struct Music_iOS_App_Tab_View: View { // create a view for changing scenes
    
    @State var selectedTab: Int = 0 // change the view based in the selectedTab var
    
    var body: some View {
        TabView(selection: $selectedTab) { // tab based navigation and link selection to selectedTab
            Music_iOS_App_Home(selectedTab: $selectedTab) // display the home view
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0) // change the active tab
            
            Music_iOS_App_Read()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Read")
                }
                .tag(1)
            
            Music_iOS_App_Quiz()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Quiz")
                }
                .tag(2)
            
        }
    }
}
// preview for development
#Preview {
    Music_iOS_App_Tab_View()
}
