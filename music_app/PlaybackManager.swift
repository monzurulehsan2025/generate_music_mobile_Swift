import SwiftUI
import Combine

class PlaybackManager: ObservableObject {
    @Published var currentSong: Song? = nil
    @Published var isPlaying: Bool = false
    
    static let shared = PlaybackManager()
    
    func play(song: Song) {
        currentSong = song
        isPlaying = true
    }
    
    func togglePlayback() {
        isPlaying.toggle()
    }
}
