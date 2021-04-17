import SwiftUI
import AVFoundation

public struct ContentView: View {
    @State var showingHelp = false
    @State var playing = false
    @State var launching = true
    @State var page = Page.launch
    
    var music: AVAudioPlayer!
    
    public init() {
        if let musicURL = Bundle.main.url(forResource: "Exoplanet", withExtension: "mp3") {
            if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
                music = audioPlayer
                music.numberOfLoops = -1
                music.volume = 0.4
            }
        }
    }
    
    public var body: some View {
        MainScreen(showingHelp: $launching, playing: $playing, page: $page)
            .onAppear { launch() }
            .fullScreenCover(isPresented: $launching) {
                switch page {
                    case .launch:
                        LaunchScreen()
                    case .help:
                        HelpView()
                }
            }
            .onChange(of: playing) { value in
                if music.isPlaying {
                    music.pause()
                } else {
                    music.play()
                }
            }
    }
    
    func launch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation {
                playSound(sound: "launch-2", type: "wav", volume: 0.4)
                sleep(1)
                launching = false
            }
        }
    }
}
