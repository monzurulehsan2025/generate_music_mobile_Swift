import Foundation

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let style: String
    let duration: String
    let coverArt: String
    let isAI: Bool
}

struct Hook: Identifiable {
    let id = UUID()
    let creator: String
    let songTitle: String
    let likes: String
    let thumbnail: String
    let videoUrl: String
}

struct MockData {
    static let songs = [
        Song(title: "Cyberpunk Dreams", artist: "Nova AI", style: "Synthwave", duration: "3:45", coverArt: "music.note", isAI: true),
        Song(title: "Neon Rain", artist: "Nova AI", style: "Lo-fi Hip Hop", duration: "2:30", coverArt: "waveform", isAI: true),
        Song(title: "Midnight Drive", artist: "Aero", style: "Retrowave", duration: "4:12", coverArt: "opticaldisc", isAI: false)
    ]
    
    static let hooks = [
        Hook(creator: "@neon_music", songTitle: "Digital Sunset", likes: "12.5k", thumbnail: "sparkles", videoUrl: ""),
        Hook(creator: "@future_vibes", songTitle: "AI Revolution", likes: "8.2k", thumbnail: "bolt.fill", videoUrl: ""),
        Hook(creator: "@nova_master", songTitle: "Symphonic AI", likes: "25.1k", thumbnail: "star.fill", videoUrl: "")
    ]
}
