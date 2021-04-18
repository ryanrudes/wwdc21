import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?
public func playSound(sound: String, type: String, volume: Float) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.volume = volume
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}

public func progress2color(progress: Double) -> Color {
    let remaining = 1.0 - progress
    return Color(
        red: (remaining * 48 + progress * 255) / 255.0,
        green: (remaining * 209 + progress * 69) / 255.0,
        blue: (remaining * 88 + progress * 58) / 255.0
    )
}

public let category2label: [Category: String] = [
    .astronomy: "Astronomy and astrophysics",
    .geology: "Geology and planetary science",
    .biology: "Biology",
    .physics: "Particle Physics",
    .math: "Mathematics",
    .technology: "Technology and culture",
    .all: "All"
]

public let category2color: [Category: Color] = [
    .astronomy: .orange,
    .geology: .green,
    .biology: .red,
    .physics: .orange,
    .math: .blue,
    .technology: .white,
    .all: .green
]
