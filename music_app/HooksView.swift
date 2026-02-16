import SwiftUI

struct HooksView: View {
    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(MockData.hooks) { hook in
                        HookCard(hook: hook)
                            .frame(height: UIScreen.main.bounds.height - 100)
                    }
                }
            }
            .padding(.bottom, 60)
            
            // Top Navigation Overlay
            VStack {
                HStack {
                    Text("Hooks")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundStyle(.white)
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct HookCard: View {
    let hook: Hook
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Mock Video Background
            Rectangle()
                .fill(LinearGradient(colors: [Color.black.opacity(0.4), .clear, Color.black.opacity(0.8)], startPoint: .top, endPoint: .bottom))
                .overlay(
                    Image(systemName: hook.thumbnail)
                        .font(.system(size: 80))
                        .foregroundStyle(.white.opacity(0.2))
                )
            
            // Interaction Sidebar
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(hook.creator)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(hook.songTitle)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.8))
                    
                    HStack {
                        Image(systemName: "music.note")
                        Text("Original Audio - Nova AI")
                    }
                    .font(.caption)
                    .foregroundStyle(AppTheme.primary)
                }
                .padding()
                
                Spacer()
                
                VStack(spacing: 20) {
                    InteractionButton(icon: "heart.fill", label: hook.likes)
                    InteractionButton(icon: "bubble.right.fill", label: "245")
                    InteractionButton(icon: "arrowshape.turn.up.right.fill", label: "Share")
                    
                    // Rotating Vinyl Mock
                    Circle()
                        .fill(AppTheme.gradient)
                        .frame(width: 45, height: 45)
                        .overlay(Image(systemName: "stop.fill").font(.caption).foregroundStyle(.white))
                }
                .padding()
            }
        }
    }
}

struct InteractionButton: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Circle()
                .fill(.white.opacity(0.1))
                .frame(width: 45, height: 45)
                .overlay(Image(systemName: icon).foregroundStyle(.white))
                .glassStyle()
            
            Text(label)
                .font(.caption2)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    HooksView()
}
