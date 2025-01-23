import SwiftUI

struct Music_iOS_App_Home: View {
    @Binding var selectedTab: Int // Binding to control the tab view
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 20) {
                        Spacer()
                    
                            Music_iOS_Section_Intro(geometry: geometry)
                        
                        Button(action: { selectedTab = 1 }) {
                            Music_iOS_Section_One(geometry: geometry)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: { selectedTab = 1 }) {
                            Music_iOS_Section_Two(geometry: geometry)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: { selectedTab = 1 }) {
                            Music_iOS_Section_Three(geometry: geometry)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
    }
}

#Preview {
    Music_iOS_App_Home(selectedTab: .constant(0))
}
