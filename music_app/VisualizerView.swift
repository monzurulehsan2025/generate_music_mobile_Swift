import SwiftUI

struct VisualizerView: View {
    @ObservedObject var playbackManager = PlaybackManager.shared
    @State private var phase: Double = 0
    
    let barCount = 12
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            ForEach(0..<barCount, id: \.self) { index in
                VisualizerBar(
                    index: index, 
                    isPlaying: playbackManager.isPlaying
                )
            }
        }
        .frame(height: 100)
    }
}

struct VisualizerBar: View {
    let index: Int
    let isPlaying: Bool
    @State private var height: CGFloat = 10
    
    var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .fill(AppTheme.gradient)
            .frame(width: 6, height: height)
            .onAppear {
                animate()
            }
            .onChange(of: isPlaying) { _ in
                animate()
            }
    }
    
    func animate() {
        if isPlaying {
            let duration = Double.random(in: 0.3...0.7)
            withAnimation(.easeInOut(duration: duration).repeatForever(autoreverses: true)) {
                height = CGFloat.random(in: 20...100)
            }
        } else {
            withAnimation(.spring()) {
                height = 10
            }
        }
    }
}
