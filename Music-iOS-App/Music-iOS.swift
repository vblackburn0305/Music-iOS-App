//
//  Music-iOS.swift
//  Music-iOS-App
//
//  Created by Vincent Blackburn on 10/23/24.
//

import SwiftUI

struct Music_iOS: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 20) {
                        Spacer()
                        
                        
                        Music_iOS_Section_One(geometry: geometry)
                        
                        Music_iOS_Section_Two(geometry: geometry)

                        Music_iOS_Section_Three(geometry: geometry)
                        
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
    }
}

#Preview {
    Music_iOS()
}
