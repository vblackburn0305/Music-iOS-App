import SwiftUI

struct Music_iOS_App_Tab_View: View {
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Music_iOS_App_Home(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
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

#Preview {
    Music_iOS_App_Tab_View()
}
