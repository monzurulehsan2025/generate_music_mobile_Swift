//
//  ContentView.swift
//  music_app
//
//  Created by Monzurul Ehsan on 2/16/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    init() {
        // Modern Tab Bar Appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(AppTheme.background.opacity(0.9))
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HooksView()
                    .tabItem {
                        Label("Hooks", systemImage: "play.square.stack.fill")
                    }
                    .tag(0)
                
                NovaStudioView()
                    .tabItem {
                        Label("Studio", systemImage: "sparkles")
                    }
                    .tag(1)
                
                LibraryView()
                    .tabItem {
                        Label("Library", systemImage: "music.note.list")
                    }
                    .tag(2)
            }
            .tint(AppTheme.primary)
            
            // Persistent Mini Player
            MiniPlayerView()
        }
    }
}

#Preview {
    ContentView()
}
