import SwiftUI

struct NovaStudioView: View {
    @State private var prompt: String = ""
    @State private var isGenerating: Bool = false
    @State private var progress: Double = 0.0
    
    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    Text("Nova Studio")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)
                    
                    // Prompt Input Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("What kind of music do you want?")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.6))
                        
                        TextEditor(text: $prompt)
                            .frame(height: 120)
                            .padding()
                            .background(AppTheme.surface)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(AppTheme.primary.opacity(0.3), lineWidth: 1)
                            )
                            .foregroundStyle(.white)
                        
                        Button(action: { generateMusic() }) {
                            HStack {
                                Spacer()
                                if isGenerating {
                                    ProgressView()
                                        .tint(.white)
                                } else {
                                    Text("Create")
                                        .fontWeight(.bold)
                                    Image(systemName: "sparkles")
                                }
                                Spacer()
                            }
                            .padding()
                            .background(AppTheme.gradient)
                            .cornerRadius(12)
                            .foregroundStyle(.white)
                        }
                    }
                    
                    if isGenerating {
                        GeneratingStatusView(progress: progress)
                            .transition(.opacity)
                    }
                    
                    // Recent Generations
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Your Studio Tracks")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        ForEach(MockData.songs) { song in
                            StudioTrackRow(song: song)
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    func generateMusic() {
        withAnimation {
            isGenerating = true
            progress = 0.0
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if progress < 1.0 {
                progress += 0.02
            } else {
                timer.invalidate()
                isGenerating = false
            }
        }
    }
}

struct GeneratingStatusView: View {
    var progress: Double
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Synthesizing your track...")
                    .foregroundStyle(.white)
                Spacer()
                Text("\(Int(progress * 100))%")
                    .foregroundStyle(AppTheme.primary)
            }
            
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.white.opacity(0.1))
                    .frame(height: 8)
                
                Capsule()
                    .fill(AppTheme.gradient)
                    .frame(width: CGFloat(progress) * (UIScreen.main.bounds.width - 64), height: 8)
            }
        }
        .padding()
        .glassStyle()
    }
}

struct StudioTrackRow: View {
    let song: Song
    
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(AppTheme.surface)
                    .frame(width: 60, height: 60)
                
                Image(systemName: song.coverArt)
                    .foregroundStyle(AppTheme.primary)
                    .font(.title2)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(song.title)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(song.style)
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.5))
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(song.duration)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.4))
                
                if song.isAI {
                    Text("AI")
                        .font(.system(size: 8, weight: .bold))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(AppTheme.primary.opacity(0.2))
                        .cornerRadius(4)
                        .foregroundStyle(AppTheme.primary)
                }
            }
            
            Image(systemName: "ellipsis")
                .foregroundStyle(.white.opacity(0.5))
        }
        .padding()
        .background(AppTheme.surface.opacity(0.5))
        .cornerRadius(15)
        .onTapGesture {
            withAnimation {
                PlaybackManager.shared.play(song: song)
            }
        }
    }
}

#Preview {
    NovaStudioView()
}
