//
//  Music-iOS-App-Tab-View.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 10/25/24.
//

import SwiftUI

struct Music_iOS_App_Tab_View: View {
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        TabView {
            Music_iOS()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            Text("Read Tab")
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Read")
                }
                .tag(1)
            
            Text("Quiz Tab")
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
