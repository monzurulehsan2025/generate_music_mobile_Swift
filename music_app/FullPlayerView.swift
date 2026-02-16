import SwiftUI

struct FullPlayerView: View {
    @ObservedObject var playbackManager = PlaybackManager.shared
    @Binding var isPresented: Bool
    
    var body: some View {
        if let song = playbackManager.currentSong {
            ZStack {
                AppTheme.background.ignoresSafeArea()
                
                // Animated Background Glow
                Circle()
                    .fill(AppTheme.primary.opacity(0.15))
                    .blur(radius: 100)
                    .offset(x: -100, y: -200)
                
                VStack(spacing: 40) {
                    // Close Button
                    HStack {
                        Button(action: { isPresented = false }) {
                            Image(systemName: "chevron.down.circle.fill")
                                .font(.title)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        Spacer()
                        Text("Now Playing")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.8))
                        Spacer()
                        Image(systemName: "ellipsis.circle.fill")
                            .font(.title)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    .padding()
                    
                    // Large Cover Art with Visualizer Overlay
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(AppTheme.surface)
                            .frame(width: 320, height: 320)
                            .overlay(
                                Image(systemName: song.coverArt)
                                    .font(.system(size: 100))
                                    .foregroundStyle(AppTheme.gradient)
                            )
                            .glassStyle()
                        
                        VisualizerView()
                            .padding(.top, 240)
                    }
                    .padding(.top, 20)
                    
                    // Track Info
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(song.title)
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundStyle(.white)
                                Text(song.artist)
                                    .font(.title3)
                                    .foregroundStyle(AppTheme.primary)
                            }
                            Spacer()
                            Image(systemName: "heart.fill")
                                .font(.title)
                                .foregroundStyle(AppTheme.primary)
                        }
                        
                        // Fake Scrubber
                        VStack(spacing: 8) {
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .fill(.white.opacity(0.1))
                                    .frame(height: 6)
                                Capsule()
                                    .fill(AppTheme.gradient)
                                    .frame(width: 140, height: 6)
                            }
                            
                            HStack {
                                Text("1:24").font(.caption).foregroundStyle(.white.opacity(0.5))
                                Spacer()
                                Text(song.duration).font(.caption).foregroundStyle(.white.opacity(0.5))
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                    
                    // Main Controls
                    HStack(spacing: 50) {
                        Image(systemName: "shuffle")
                            .font(.title2)
                            .foregroundStyle(.white.opacity(0.4))
                        
                        Image(systemName: "backward.fill")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                        
                        Button(action: { playbackManager.togglePlayback() }) {
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 80, height: 80)
                                Image(systemName: playbackManager.isPlaying ? "pause.fill" : "play.fill")
                                    .font(.system(size: 40))
                                    .foregroundStyle(.black)
                            }
                        }
                        
                        Image(systemName: "forward.fill")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                        
                        Image(systemName: "repeat")
                            .font(.title2)
                            .foregroundStyle(.white.opacity(0.4))
                    }
                    
                    Spacer()
                    
                    // Meta Info
                    HStack {
                        Image(systemName: "hifispeaker.fill")
                        Text("AirPlay: Studio Monitors")
                        Spacer()
                        Image(systemName: "list.bullet")
                    }
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.6))
                    .padding()
                }
            }
        }
    }
}

#Preview {
    FullPlayerView(isPresented: .constant(true))
}
