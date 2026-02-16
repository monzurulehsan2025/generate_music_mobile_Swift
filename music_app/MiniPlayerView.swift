import SwiftUI

struct MiniPlayerView: View {
    @ObservedObject var playbackManager = PlaybackManager.shared
    
    var body: some View {
        if let song = playbackManager.currentSong {
            HStack(spacing: 12) {
                // Track Art
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(AppTheme.surface)
                        .frame(width: 44, height: 44)
                    
                    Image(systemName: song.coverArt)
                        .foregroundStyle(AppTheme.primary)
                }
                
                // Info
                VStack(alignment: .leading, spacing: 2) {
                    Text(song.title)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.white)
                    Text(song.artist)
                        .font(.system(size: 12))
                        .foregroundStyle(.white.opacity(0.6))
                }
                
                Spacer()
                
                // Controls
                HStack(spacing: 20) {
                    Button(action: { playbackManager.togglePlayback() }) {
                        Image(systemName: playbackManager.isPlaying ? "pause.fill" : "play.fill")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }
                    
                    Button(action: { /* Next track */ }) {
                        Image(systemName: "forward.fill")
                            .font(.title3)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(AppTheme.surface.opacity(0.8))
            .glassStyle()
            .padding(.horizontal)
            .padding(.bottom, 90) // Above Tab Bar
            .transition(.move(edge: .bottom).combined(with: .opacity))
        }
    }
}
