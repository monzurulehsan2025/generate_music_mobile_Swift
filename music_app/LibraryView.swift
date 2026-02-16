import SwiftUI

struct LibraryView: View {
    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    Text("Library")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Saved AI Tracks")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.6))
                        
                        ForEach(MockData.songs) { song in
                            StudioTrackRow(song: song)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Your Hooks")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.6))
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                            ForEach(MockData.hooks) { hook in
                                HookGridItem(hook: hook)
                            }
                        }
                    }
                }
                .padding()
                .padding(.bottom, 150) // For mini player and tab bar
            }
        }
    }
}

struct HookGridItem: View {
    let hook: Hook
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(AppTheme.surface)
                    .aspectRatio(0.8, contentMode: .fill)
                    .overlay(
                        Image(systemName: hook.thumbnail)
                            .font(.title)
                            .foregroundStyle(AppTheme.primary.opacity(0.5))
                    )
                
                HStack {
                    Image(systemName: "play.fill")
                    Text(hook.likes)
                }
                .font(.caption2)
                .foregroundStyle(.white)
                .padding(8)
                .glassStyle()
                .padding(8)
            }
            
            Text(hook.songTitle)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    LibraryView()
}
