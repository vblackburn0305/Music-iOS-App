//
//  Music-iOS-App-Tab-View.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 10/25/24.
//

import SwiftUI

struct Music_iOS_App_Tab_View: View {
    var body: some View {
        TabView {
            Music_iOS()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Text("Read Tab")
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Read")
                }
            Text("Quiz Tab")
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Quiz")
                }
        }
    }
}

#Preview {
    Music_iOS_App_Tab_View()
}
